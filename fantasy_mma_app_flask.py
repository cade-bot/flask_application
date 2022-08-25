from flask import Flask, render_template, request, redirect
from models import db, StableModel
import config


def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = config.DATABASE_CONNECTION_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.app_context().push()
    db.init_app(app)
    db.create_all()
    return app

app = create_app()
app.run(host='localhost', port=5000)


@app.route('/')
def index():
    return render_template('home.html')


@app.route('/data/create', methods=['GET', 'POST'])
def create():
    if request.method == 'GET':
        return render_template('createpage.html')

    if request.method == 'POST':
        stableid = request.form['stableid']
        fighterid = request.form['fighterid']
        name = request.form['name']
        owner = request.form['owner']
        stable = StableModel(stableid=stableid, fighterid=fighterid, name=name, owner=owner)
        db.session.add(stable)
        db.session.commit()
        return redirect('/data')


@app.route('/data')
def RetrieveDataList():
    stables = StableModel.query.all()
    return render_template('datalist.html', stables=stables)


@app.route('/data/<int:id>')
def RetrieveSingleFighter(id):
    stable = StableModel.query.filter_by(stableid=id).first()
    if stable:
        return render_template('data.html', stable=stable)
    return f"Stable with id ={id} Does not exist"


@app.route('/data/<int:id>/update/', methods=['GET', 'POST'])
def update(id):
    stable = StableModel.query.filter_by(stableid=id).first()
    if request.method == 'POST':
        if stable:
            db.session.delete(stable)
            db.session.commit()
            stableid = request.form['stableid']
            fighterid = request.form['fighterid']
            name = request.form['name']
            owner = request.form['owner']
            stable = StableModel(stableid=stableid, fighterid=fighterid, name=name, owner=owner)

            db.session.add(stable)
            db.session.commit()
            return redirect(f'/data/{id}')
        return f"Stable with id = {id} Does not exist"

    return render_template('update.html', stable=stable)


@app.route('/data/<int:id>/delete', methods=['GET', 'POST'])
def delete(id):
    stable = StableModel.query.filter_by(stableid=id).first()
    if request.method == 'POST':
        if stable:
            db.session.delete(stable)
            db.session.commit()
            return redirect('/data')

    return render_template('delete.html')
