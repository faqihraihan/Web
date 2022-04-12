import os
import numpy as np
import patoolib
import folium
import base64
from sqlalchemy import and_
from sqlalchemy.sql import extract
import geopandas as gpd
from folium.plugins import MousePosition
from flask import Blueprint, render_template, url_for, redirect, request, flash, jsonify
from flask_login import login_required, current_user
from bs4 import BeautifulSoup
import requests
from .models import User, Desa, Kecamatan, Kabupaten, Provinsi, Peta_Desa, Jumlah_Penduduk, Luas_Wilayah
from . import db

main = Blueprint('main', __name__)


@ main.route("/")
def home():
    url = 'https://hargapangan.id/tabel-harga/pedagang-besar/daerah'
    page = requests.get(url)

    soup = BeautifulSoup(page.content, "html.parser")

    val_time = soup.findAll("tr")[0]
    arr_time = []
    for i in range(2, 8):
        time = val_time.findAll("th")[i].text.replace('"', '')
        arr_time.append(time)

    val_price = soup.findAll("tr")[1]
    arr_price = []
    for j in range(2, 8):
        price = val_price.findAll("td")[j].text.replace(
            '.', '').replace('"', '')
        arr_price.append(price)

    data = {'time': arr_time, 'price': arr_price}

    if current_user.is_authenticated:
        image = None
        if current_user.img:
            image = base64.b64encode(current_user.img).decode('ascii')

        return render_template("main.html", img=image, name=current_user.nama, data=data)
    return render_template("main.html", data=data)


@ main.route("/gis", methods=['GET', 'POST'])
@ main.route("/gis/<id>", methods=['GET', 'POST'])
def gis(id=None):
    if id:
        data = Peta_Desa.query.filter_by(id=id).first()

        layer = gpd.read_file(data.json)
        layer = layer.to_crs("EPSG:4326")

        m = folium.Map(location=[-1.1265694, 118.6380067],
                   zoom_start=5, min_zoom=5)

        for x in layer.index:
            color = np.random.randint(16, 256, size=3)
            color = [str(hex(i))[2:] for i in color]
            color = '#'+''.join(color).upper()
            layer.at[x, 'color'] = color

        def style(feature):
            return {
                'fillColor': feature['properties']['color'],
                'color': feature['properties']['color'],
                'weight': 1,
                'fillOpacity': 0.7
            }

        gjson = folium.GeoJson(layer, name=data.desa, style_function=style).add_to(m)

        m.fit_bounds(gjson.get_bounds())

        folium.Popup(data.desa).add_to(gjson)

        formatter = "function(num) {return L.Util.formatNum(num, 3) + ' º ';};"
        MousePosition(
            position="bottomleft",
            separator=" | ",
            empty_string="NaN",
            lng_first=True,
            num_digits=20,
            prefix="Kordinat:",
            lat_formatter=formatter,
            lng_formatter=formatter,
        ).add_to(m)

        tile_layer = folium.TileLayer(
            tiles="http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}",
            attr='google.com',
            max_zoom=19,
            name='darkmatter',
            control=False,
            opacity=1
        )
        tile_layer.add_to(m)

        m.save("app/templates/gis-maps.html")
        return render_template("maps.html", data=data, id=id)

    m = folium.Map(location=[-1.1265694, 118.6380067],
                   zoom_start=5, min_zoom=5)

    formatter = "function(num) {return L.Util.formatNum(num, 3) + ' º ';};"
    MousePosition(
        position="bottomleft",
        separator=" | ",
        empty_string="NaN",
        lng_first=True,
        num_digits=20,
        prefix="Kordinat:",
        lat_formatter=formatter,
        lng_formatter=formatter,
    ).add_to(m)

    tile_layer = folium.TileLayer(
        tiles="http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}",
        attr='google.com',
        max_zoom=19,
        name='darkmatter',
        control=False,
        opacity=1
    )
    tile_layer.add_to(m)

    m.save("app/templates/gis-maps.html")
    return render_template("maps.html")


@ main.route("/profil")
@ login_required
def profil():
    return redirect(url_for('main.profil_me'))


@ main.route("/profil/me", methods=['GET', 'POST'])
@ login_required
def profil_me():
    all_data = User.query.all()

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')
    active = 'active'

    return render_template("profil.html", img=image, id=current_user.id, name=current_user.nama, email=current_user.email, telp=current_user.telp, level=current_user.lvl, profil_navbar=active, user=all_data)


@ main.route("/dashboard")
@ login_required
def dashboard():
    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')
    active = 'active'
    return render_template('dashboard.html', img=image, name=current_user.nama, level=current_user.lvl, dashboard_navbar=active)


@ main.route("/input-data")
@ login_required
def input_data():
    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')
    active = 'active'
    return render_template("input-data.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_navbar=active)


@ main.route("/input-data/data-desa")
@ login_required
def input_data_desa():
    active = 'active'

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')

    provinsi = Provinsi.query.all()
    all_data = Desa.query.all()
    return render_template("input-data-desa.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_desa_navbar=active, input_data_master_navbar=active, provinsi=provinsi, desa=all_data)


@ main.route("/input-data/data-desa/live-search", methods=['GET', 'POST'])
@ login_required
def live_search_data_desa():
    if request.method == 'POST':
        id = request.form['kecamatan_response']
        desa = Desa.query.filter(Desa.id_kec.like(id))
    return jsonify({'htmlresponse': render_template('data-desa-response.html', desa=desa)})


@ main.route("/input-data/data-desa/add", methods=['POST'])
@ login_required
def input_data_desa_add():
    if request.method == 'POST':
        id_kec = request.form['kecamatan']
        id_desa = request.form['id']
        id = id_kec+id_desa
        nama = request.form['nama']

        desa = Desa.query.filter_by(id=id).first()
        if desa:
            flash('ID telah digunakan')
            return redirect(url_for('main.input_data_desa'))

        add_Data = Desa(id=id, id_kec=id_kec, nama=nama)

        db.session.add(add_Data)
        db.session.commit()
        flash("Data berhasil ditambahkan")

        return redirect(url_for('main.input_data_desa'))


@ main.route("/input-data/data-desa/update", methods=['GET', 'POST'])
@ login_required
def input_data_desa_update():
    if request.method == 'POST':
        update = Desa.query.get(request.form.get('id_desa'))
        update.nama = request.form['nama']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.input_data_desa'))


@ main.route("/input-data/data-desa/delete", methods=['GET', 'POST'])
@ login_required
def input_data_desa_delete():
    id = request.form['id']
    delete = Desa.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('main.input_data_desa'))


@ main.route("/input-data/data-kecamatan")
@ login_required
def input_data_kecamatan():
    active = 'active'

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')

    provinsi = Provinsi.query.all()
    all_data = Kecamatan.query.all()
    return render_template("input-data-kecamatan.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_kecamatan_navbar=active, input_data_master_navbar=active, provinsi=provinsi, kecamatan=all_data)


@ main.route("/input-data/data-kecamatan/live-search", methods=['GET', 'POST'])
@ login_required
def live_search_data_kecamatan():
    if request.method == 'POST':
        id = request.form['kabupaten_response']
        kecamatan = Kecamatan.query.filter(Kecamatan.id_kab.like(id))
    return jsonify({'htmlresponse': render_template('data-kecamatan-response.html', kecamatan=kecamatan)})


@ main.route("/input-data/data-kecamatan/add", methods=['POST'])
@ login_required
def input_data_kecamatan_add():
    if request.method == 'POST':
        id_kab = request.form['kabupaten']
        id_kec = request.form['id']
        id = id_kab+id_kec
        nama = request.form['nama']

        kec = Kecamatan.query.filter_by(id=id).first()
        if kec:
            flash('ID telah digunakan')
            return redirect(url_for('main.input_data_kecamatan'))

        add_Data = Kecamatan(id=id, id_kab=id_kab, nama=nama)

        db.session.add(add_Data)
        db.session.commit()
        flash("Data berhasil ditambahkan")

        return redirect(url_for('main.input_data_kecamatan'))


@ main.route("/input-data/data-kecamatan/update", methods=['GET', 'POST'])
@ login_required
def input_data_kecamatan_update():
    if request.method == 'POST':
        update = Kecamatan.query.get(request.form.get('id_kecamatan'))
        update.nama = request.form['nama']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.input_data_kecamatan'))


@ main.route("/input-data/data-kecamatan/delete", methods=['GET', 'POST'])
@ login_required
def input_data_kecamatan_delete():
    id = request.form['id']
    delete = Kecamatan.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('main.input_data_kecamatan'))


@ main.route("/input-data/data-kabupaten")
@ login_required
def input_data_kabupaten():
    active = 'active'

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')

    provinsi = Provinsi.query.all()
    all_data = Kabupaten.query.all()
    return render_template("input-data-kabupaten.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_kabupaten_navbar=active, input_data_master_navbar=active, provinsi=provinsi, kabupaten=all_data)


@ main.route("/input-data/data-kabupaten/live-search", methods=['GET', 'POST'])
@ login_required
def live_search_data_kabupaten():
    if request.method == 'POST':
        id = request.form['provinsi_response']
        kabupaten = Kabupaten.query.filter(Kabupaten.id_prov.like(id))
    return jsonify({'htmlresponse': render_template('data-kabupaten-response.html', kabupaten=kabupaten)})


@ main.route("/input-data/data-kabupaten/add", methods=['POST'])
@ login_required
def input_data_kabupaten_add():
    if request.method == 'POST':
        id_prov = request.form['provinsi']
        id_kab = request.form['id']
        id = id_prov+id_kab
        nama = request.form['nama']

        kab = Kabupaten.query.filter_by(id=id).first()
        if kab:
            flash('ID telah digunakan')
            return redirect(url_for('main.input_data_kabupaten'))

        add_Data = Kabupaten(id=id, id_prov=id_prov, nama=nama)

        db.session.add(add_Data)
        db.session.commit()
        flash("Data berhasil ditambahkan")

        return redirect(url_for('main.input_data_kabupaten'))


@ main.route("/input-data/data-kabupaten/update", methods=['GET', 'POST'])
@ login_required
def input_data_kabupaten_update():
    if request.method == 'POST':
        update = Kabupaten.query.get(request.form.get('id_kabupaten'))
        update.nama = request.form['nama']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.input_data_kabupaten'))


@ main.route("/input-data/data-kabupaten/delete", methods=['GET', 'POST'])
@ login_required
def input_data_kabupaten_delete():
    id = request.form['id']
    delete = Kabupaten.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('main.input_data_kabupaten'))


@ main.route("/input-data/data-provinsi")
@ login_required
def input_data_provinsi():
    active = 'active'

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')

    all_data = Provinsi.query.all()
    return render_template("input-data-provinsi.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_provinsi_navbar=active, input_data_master_navbar=active, provinsi=all_data)

@ main.route("/input-data/data-provinsi/add", methods=['POST'])
@ login_required
def input_data_provinsi_add():
    if request.method == 'POST':
        id = request.form['id']
        nama = request.form['nama']

        prov = Provinsi.query.filter_by(id=id).first()
        if prov:
            flash('ID telah digunakan')
            return redirect(url_for('main.input_data_provinsi'))

        add_Data = Provinsi(id=id, nama=nama)

        db.session.add(add_Data)
        db.session.commit()
        flash("Data berhasil ditambahkan")

        return redirect(url_for('main.input_data_provinsi'))


@ main.route("/input-data/data-provinsi/update", methods=['GET', 'POST'])
@ login_required
def input_data_provinsi_update():
    if request.method == 'POST':
        update = Provinsi.query.get(request.form.get('id_provinsi'))
        update.nama = request.form['nama']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.input_data_provinsi'))


@ main.route("/input-data/data-provinsi/delete", methods=['GET', 'POST'])
@ login_required
def input_data_provinsi_delete():
    id = request.form['id']
    delete = Provinsi.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('main.input_data_provinsi'))


@ main.route("/input-data/peta-desa")
@ login_required
def input_data_peta_desa():
    active = 'active'

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')

    provinsi = Provinsi.query.all()
    all_data = Peta_Desa.query.all()
    return render_template("input-data-peta-desa.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_spasial_navbar=active, provinsi=provinsi, peta_desa=all_data)


@ main.route("/input-data/peta-desa/add", methods=['GET', 'POST'])
@ login_required
def input_data_peta_desa_add():
    if request.method == 'POST':
        prov = request.form['provinsi']
        kab = request.form['kabupaten']
        kec = request.form['kecamatan']
        des = request.form['desa']
        file = request.files['json']

        provinsi = Provinsi.query.filter_by(id=prov).first()
        kabupaten = Kabupaten.query.filter_by(id=kab).first()
        kecamatan = Kecamatan.query.filter_by(id=kec).first()
        desa = Desa.query.filter_by(id=des).first()
        peta_desa = Peta_Desa.query.filter_by(id_desa=des).first()
        
        if peta_desa:
            flash('ID telah digunakan')
            return redirect(url_for('main.input_data_peta_desa'))

        json = "{}.json".format(des)
        nama = "{} {} {} {}".format(provinsi.nama, kabupaten.nama, kecamatan.nama, desa.nama)
        extfile = file.filename.rsplit('.', 1)[1].lower()

        file.save(os.path.join("app/static/json/temporary", "{}.{}".format(des, extfile)))
        patoolib.extract_archive("app/static/json/temporary/{}.{}".format(des, extfile), outdir="app/static/json/temporary/")

        dir = 'app/static/json/temporary'
        search_shp = [f for f in os.listdir(dir) if f.endswith(".shp")]

        gjson = gpd.read_file("app/static/json/temporary/{}".format(search_shp[0]))
        gjson.to_file("app/static/json/temporary/{}".format(json), driver='GeoJSON')
        gjson = gjson.to_json()
        add_Data = Peta_Desa(id_desa=des, nama=nama, json=gjson)

        db.session.add(add_Data)
        db.session.commit()

        for f in os.listdir(dir):
            os.remove(os.path.join(dir, f))

        flash("Data berhasil ditambahkan")

        return redirect(url_for('main.input_data_peta_desa'))


@ main.route("/input-data/peta-desa/update", methods=['GET', 'POST'])
@ login_required
def input_data_peta_desa_update():
    if request.method == 'POST':
        update = Peta_Desa.query.get(request.form.get('id_desa'))
        id = request.form['id_desa']
        file = request.files['json']

        if file:
            json = "{}.json".format(id)
            extfile = file.filename.rsplit('.', 1)[1].lower()

            file.save(os.path.join("app/static/json/temporary", "{}.{}".format(id, extfile)))
            patoolib.extract_archive("app/static/json/temporary/{}.{}".format(id, extfile), outdir="app/static/json/temporary/")

            dir = 'app/static/json/temporary'
            search_shp = [f for f in os.listdir(dir) if f.endswith(".shp")]

            gjson = gpd.read_file("app/static/json/temporary/{}".format(search_shp[0]))
            gjson.to_file("app/static/json/temporary/{}".format(json), driver='GeoJSON')
            gjson = gjson.to_json()

            update.json = gjson

            for f in os.listdir(dir):
                os.remove(os.path.join(dir, f))

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.input_data_peta_desa'))


@ main.route("/input-data/peta-desa/delete", methods=['GET', 'POST'])
@ login_required
def input_data_peta_desa_delete():
    id = request.form['id']
    delete = Peta_Desa.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('main.input_data_peta_desa'))


@ main.route("/input-data/data-jumlah-penduduk")
@ login_required
def input_data_jumlah_penduduk():
    active = 'active'

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')

    provinsi = Provinsi.query.all()
    all_data = Jumlah_Penduduk.query.all()
    return render_template("input-data-jumlah-penduduk.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_jumlah_penduduk_navbar=active, input_data_per_desa_navbar=active, jumlah_penduduk=all_data, provinsi=provinsi)


@ main.route("/input-data/data-jumlah-penduduk/add", methods=['POST'])
@ login_required
def input_data_jumlah_penduduk_add():
    if request.method == 'POST':
        desa = request.form['desa']
        jumlah = request.form['jumlah']
        thn = request.form['thn']
        id = desa+thn

        jumlah_penduduk = Jumlah_Penduduk.query.filter(and_(Jumlah_Penduduk.id_desa.like(desa), Jumlah_Penduduk.thn.like(thn))).first()
        if jumlah_penduduk:
            flash('ID telah mempunyai data tahun tersebut')
            return redirect(url_for('main.input_data_jumlah_penduduk'))

        add_Data = Jumlah_Penduduk(id=id, id_desa=desa, jumlah=jumlah, thn=thn)

        db.session.add(add_Data)
        db.session.commit()
        flash("Data berhasil ditambahkan")

        return redirect(url_for('main.input_data_jumlah_penduduk'))


@ main.route("/input-data/data-jumlah-penduduk/update", methods=['GET', 'POST'])
@ login_required
def input_data_jumlah_penduduk_update():
    if request.method == 'POST':
        update = Jumlah_Penduduk.query.get(request.form.get('id_jumlah_penduduk'))
        update.jumlah = request.form['jumlah']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.input_data_jumlah_penduduk'))


@ main.route("/input-data/data-jumlah-penduduk/delete", methods=['GET', 'POST'])
@ login_required
def input_data_jumlah_penduduk_delete():
    id = request.form['id']
    delete = Jumlah_Penduduk.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('main.input_data_jumlah_penduduk'))


@ main.route("/input-data/data-luas-wilayah")
@ login_required
def input_data_luas_wilayah():
    active = 'active'

    image = None
    if current_user.img:
        image = base64.b64encode(current_user.img).decode('ascii')

    provinsi = Provinsi.query.all()
    all_data = Luas_Wilayah.query.all()
    return render_template("input-data-luas-wilayah.html", img=image, name=current_user.nama, level=current_user.lvl, input_data_luas_wilayah_navbar=active, input_data_per_desa_navbar=active, luas_wilayah=all_data, provinsi=provinsi)


@ main.route("/input-data/data-luas-wilayah/add", methods=['POST'])
@ login_required
def input_data_luas_wilayah_add():
    if request.method == 'POST':
        desa = request.form['desa']
        luas = request.form['luas']
        thn = request.form['thn']
        id = desa+thn

        luas_wilayah = Luas_Wilayah.query.filter(and_(Luas_Wilayah.id_desa.like(desa), Luas_Wilayah.thn.like(thn))).first()
        if luas_wilayah:
            flash('ID telah mempunyai data tahun tersebut')
            return redirect(url_for('main.input_data_luas_wilayah'))

        add_Data = Luas_Wilayah(id=id, id_desa=desa, luas=luas, thn=thn)

        db.session.add(add_Data)
        db.session.commit()
        flash("Data berhasil ditambahkan")

        return redirect(url_for('main.input_data_luas_wilayah'))


@ main.route("/input-data/data-luas-wilayah/update", methods=['GET', 'POST'])
@ login_required
def input_data_luas_wilayah_update():
    if request.method == 'POST':
        update = Luas_Wilayah.query.get(request.form.get('id_luas_wilayah'))
        update.luas = request.form['luas']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.input_data_luas_wilayah'))


@ main.route("/input-data/data-luas-wilayah/delete", methods=['GET', 'POST'])
@ login_required
def input_data_luas_wilayah_delete():
    id = request.form['id']
    delete = Luas_Wilayah.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('main.input_data_luas_wilayah'))