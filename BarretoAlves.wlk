//Correccion: 7
class Villanos{
	var objetivo
	var estado
	constructor(o,e){
		objetivo=o
		estado=e
	}
	method realizarMaldades(victimas){}
	method fuerza()
	method estarInconsciente(){
		estado=inconsciente
	}
	//Nombre confuso, quedarProfugo() hubiera quedado mejor
	method estaProfugo(){
		estado=profugo
	}
	method mostrarEstado(){
		return estado
	}
	method integrantes(){
		return 1
	}
}
object profugo{
	method estaProfugo(){
		return true
	}
}
object inconsciente{
	method estaProfugo(){
		return false
	}
}
class PandilladeVillanos inherits Villanos{
	var miembros=[]
	constructor(o,e,m)=super(o,e){
		miembros=m
	}
	override method fuerza(){
		return miembros.sum({m=>m.fuerza()})
	}
	override method realizarMaldades(victimas){
		miembros.foreach({m=>m.realizarMaldades()})
	}
	override method integrantes(){
		return miembros.size()
	}
	//Falta estaProfugo() en la pandilla
	//Falta quedarInconsciente en la pandilla
}
class Psicopatas inherits Villanos{
	var asesinatos
	var inteligencia
	constructor(o,e,a,i)=super(o,e){
		asesinatos=a
		inteligencia=i
	}
	override method realizarMaldades(victimas){
		asesinatos+=5
		objetivo.ataquePsycho(victimas)
	}
	override method fuerza(){
		return inteligencia*asesinatos
	}
}
class Ladrones inherits Villanos{
	var robosprevios
	var posiblesvictimas=[]
	constructor(o,e,r,p)=super(o,e){
		robosprevios=r
		posiblesvictimas=p
	}
	method filtroVictimas()
	override method fuerza(){
		return robosprevios
	}
	override method realizarMaldades(victima){
		robosprevios+=1
		victima.serRobado()
		//Nunca usas el filtro de victima, realizarMaldades(victima) no es polimorfico con realizarMaldades(victimas) de la clase villano
		//Iba encaminado, pero se nota que no esta terminado.
	}
}
class LadronesGBlanco inherits Ladrones{
	constructor(o,e,r,p)=super(o,e,r,p)
	override method filtroVictimas(){
		posiblesvictimas = objetivo.mostrarHabitantes().filter({h=>h.mostrarDinero()>5000000})
	}
}
class LadronesGMarron inherits Ladrones{
	constructor(o,e,r,p)=super(o,e,r,p)
	override method filtroVictimas(){
		posiblesvictimas = objetivo.mostrarHabitantes().filter({h=>h.mostrarDinero()>1000000 && h.mostrarDinero() < 5000000})
	}
}
class Persona{
	var dinero
	constructor(d){
		dinero=d
	}
	method mostrarDinero(){
		return dinero
	}
	method serRobado(){
		dinero = 0
	}
}
object ciudadGotica{
	var habitantes=[]
	var villanos=[]
	method ataquePsycho(victimas){
		habitantes.remove(victimas)
		//La idea no estaba mal, habia que usar removeAll
	}
	method mostrarHabitantes(){
		return habitantes
	}
	method esLujosa(){
		var poblaciontemp=[]
		poblaciontemp=habitantes.filter({h=>h.mostrarDinero()>5000000})
		return poblaciontemp.size() > habitantes.size()/2
	}
	method mostrarVillanos(){
		return villanos
	}
	method villanosProfugos(){
		return villanos.filter({v=>v.mostrarEstado().estaProfugo()})
		//v.estaProfugo() hubiera sido mejor
		/*
		 * Dentro de Villano:
		 * method estaProfugo(){
		 * 		return estado.estaProfugo()
		 * }
		 * 
		 * No baja puntos.
		 */
	}
	method sonLosMasTop(){
		return habitantes.sortedBy({h1,h2=>h1.mostrarDinero()>h2.mostrarDinero()}).take(10)
	}
}
object batman{
	var vitalidad = 800
	var stress = 8
	var baticinturon=[]
	method fuerza(){
		return vitalidad + baticinturon.sum({b=>b.poder()})
	}
	method estaEstresado(){
		return stress > 15
	}
	method combatircrimen(adversario){
		stress+=adversario.integrantes()
		if (self.fuerza() > adversario.fuerza()){
		adversario.estarInconsciente()
		}
		else{
		self.restarVitalidad(200)
		adversario.estaProfugo()
		}
		//Falto aumentar el uso de las tecnologias, lo demas bien
	}
	method desarrolartecnologia(tecnologia){
		baticinturon.add(tecnologia)
	}
	method restarVitalidad(cant){
		vitalidad-=cant
	}
	method llorarxpadres(){
		stress-=10
		baticinturon.remove(baticinturon.anyOne())
	}
	method estadeModa(){
		return baticinturon.count({b=>b.startsWith("Bati")}) == baticinturon.size()
		//b.nombre().startsWith("Bati")
	}
	method bailarBatitwist(){
		vitalidad+=100
	}
}
class Tecnologias{
	var nombre
	var potencia
	var durabilidad
	constructor(n,p,d){
		nombre=n
		potencia=p
		durabilidad=d
	}
	method poder(){
		return potencia/durabilidad
	}
}