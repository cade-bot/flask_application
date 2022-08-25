# from flask_sqlalchemy import SQLAlchemy
import flask_sqlalchemy

db = flask_sqlalchemy.SQLAlchemy()

class StableModel(db.Model):
    __tablename__ = "stables"

    stableid = db.Column(db.Integer, primary_key=True)
    fighterid = db.Column(db.String(60))
    name = db.Column(db.String(30))
    owner = db.Column(db.String(30))

    def __init__(self, stableid, fighterid, name, owner):
        self.stableid = stableid
        self.fighterid = fighterid
        self.name = name
        self.owner = owner

    def __repr__(self):
        return f"{self.stableid}:{self.owner}"

