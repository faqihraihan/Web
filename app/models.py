from flask_login import UserMixin
from datetime import datetime
from . import db


class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.VARCHAR(200), unique=True)
    password = db.Column(db.VARCHAR(200))
    nama = db.Column(db.VARCHAR(200))
    telp = db.Column(db.VARCHAR(200))
    lvl = db.Column(db.Integer)
    img = db.Column(db.LargeBinary(length=(2**32)-1))
    waktu = db.Column(db.DateTime, default=datetime.now())


class Provinsi(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.VARCHAR(200))
    waktu = db.Column(db.DateTime, default=datetime.now())
    kab = db.relationship("Kabupaten", backref="provinsi")


class Kabupaten(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    id_prov = db.Column(db.Integer, db.ForeignKey('provinsi.id'))
    nama = db.Column(db.VARCHAR(200))
    waktu = db.Column(db.DateTime, default=datetime.now())
    kec = db.relationship("Kecamatan", backref="kabupaten")


class Kecamatan(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    id_kab = db.Column(db.Integer, db.ForeignKey('kabupaten.id'))
    nama = db.Column(db.VARCHAR(200))
    waktu = db.Column(db.DateTime, default=datetime.now())
    desa = db.relationship("Desa", backref="kecamatan")


class Desa(db.Model):
    id = db.Column(db.BigInteger, primary_key=True)
    id_kec = db.Column(db.Integer, db.ForeignKey('kecamatan.id'))
    nama = db.Column(db.VARCHAR(200))
    waktu = db.Column(db.DateTime, default=datetime.now())
    peta_desa = db.relationship("Peta_Desa", backref="desa")
    jumlah_penduduk = db.relationship("Jumlah_Penduduk", backref="desa")
    luas_wilayah = db.relationship("Luas_Wilayah", backref="desa")


class Peta_Desa(db.Model):
    id = db.Column(db.BigInteger, primary_key=True)
    id_desa = db.Column(db.BigInteger, db.ForeignKey('desa.id'))
    nama = db.Column(db.VARCHAR(200))
    json = db.Column(db.JSON)
    waktu = db.Column(db.DateTime, default=datetime.now())


class Jumlah_Penduduk(db.Model):
    id = db.Column(db.BigInteger, primary_key=True)
    id_desa = db.Column(db.BigInteger, db.ForeignKey('desa.id'))
    jumlah = db.Column(db.VARCHAR(200))
    thn = db.Column(db.Integer)
    waktu = db.Column(db.DateTime, default=datetime.now())


class Luas_Wilayah(db.Model):
    id = db.Column(db.BigInteger, primary_key=True)
    id_desa = db.Column(db.BigInteger, db.ForeignKey('desa.id'))
    luas = db.Column(db.VARCHAR(200))
    thn = db.Column(db.Integer)
    waktu = db.Column(db.DateTime, default=datetime.now())