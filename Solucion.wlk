class Tecnologia{
	var nombre = ""
	var potencia
	var usos = 1
	constructor(n,p){
		nombre=n
		potencia=p
	}
	method poder(){
		return potencia/usos
	}
	method usar(){
		usos++
	}
	method estaALaModa(){
		return nombre.startsWith("bati")
	}
}

object batman{
	var estres = 8
	var vitalidad = 800
	var  rinonera  = []
	
	method desarrollarTecnologia(nombre, potencia){
		rinonera.add(new Tecnologia(nombre,potencia))
	}
	
	method fuerza(){
		return vitalidad + rinonera.sum({arma => arma.poder()})
	}
	
	method loPuedeVencer(enemigo){
		return self.fuerza() > enemigo.fuerza()
	}
	
	method combatirCrimen(enemigo){
		if(self.loPuedeVencer(enemigo))
			enemigo.quedarInconsciente()
		else{
			enemigo.quedarProfugo()
			vitalidad-=200
		}
		estres+=enemigo.cuantosSon()
		rinonera.forEach({t => t.usar()})
	}
	method llorarASusPadres(){
		estres = 0.max(estres-10)
		rinonera.remove(rinonera.anyOne())
	}
	method estaEstresado(){
		return estres > 15
	}
	method estaALaModa(){
		return rinonera.all({arma => arma.estaALaModa()})
	}	
	method batiTwist(){
		vitalidad+=100
	}
}

class Villano{
	var inconsciente = false
	var profugo = false
	var cantidadDeMaldades
	
	method fuerza(){
		return cantidadDeMaldades
	}
	
	method realizarMaldad(){
		cantidadDeMaldades++;
	}
	
	method quedarProfugo(){
		profugo = true
	}
	method quedarInconsciente(){
		inconsciente = true
		profugo = false
	}
	method cuantosSon(){
		return 1
	}
	
	method estaProfugo(){
		return profugo
	}
}
//Se podria haber usar composicion para los estados de profugo e inconsciente

class Pandilla{
	var villanos=[]
	constructor(vil){
		villanos = vil
	}
	method fuerza(){
		return villanos.sum({v => v.fuerza()})
	}
	
	method quedarProfugo(){
		villanos.forEach({v => v.quedarProfugo()})
	}
	
	method quedarInconsciente(){
		villanos.forEach({v => v.quedarInconsciente()})
	}
	
	method cuantosSon(){
		return villanos.size()
	}
}

class Psicopata inherits Villano{
	var inteligencia
	constructor(i){
		inteligencia = i
	}
	override method fuerza(){
		return super() * 5 *inteligencia
	}
	
	override method realizarMaldad(){
		super()
		ciudadGotica.perderPersonas(5)
	}
}
class Ladron inherits Villano{
	method robar()
	override method realizarMaldad(){
		super()
		self.robar()
	}
} 

class GuanteBlanco inherits Ladron{
	override method robar(){
		ciudadGotica.robarALosRicos()
	}
}
class GuanteMarron inherits Ladron{
	override method robar(){
		ciudadGotica.robarALaClaseMedia()
	}
}
//Los guantes tambien podian modelarse usando composicion

class Personas{
	var capital
	constructor(c){
		capital=c
	}
	method serRobado(){
		capital = 0
	}
	method capital(){
		return capital
	}
	method esRico(){
		return capital>5000000
	}
	method esPobre(){
		return capital<1000000
	}
	method esClaseMedia(){
		return !self.esRico() && !self.esPobre()
	}
}

object ciudadGotica {
	var personas = []
	var villanos = []
	method perderPersona(){
		personas.remove(personas.anyOne())
	}
	method perderPersonas(cantidad) {
		cantidad.times({i => self.perderPersona()}) 
	}
	
	method robarALosRicos(){
		personas.filter({p => p.esRico()}).forEach({p => p.serRobado()})			
	}
	method robarALaClaseMedia(){
		personas.filter({p => p.esClaseMedia()}).forEach({p => p.serRobado()})			
	}
	
	//Parte 2
	method esLujosa(){
		return personas.count({p=>p.esRico()}) > personas.size()/2
	}
	method sonLosMasTop(){
		return personas.sortedBy({p1,p2 => p1.capital() > p2.capital()}).take(10)
	}
	method estanProfugos(){
		return villanos.filter({v => v.estaProfugo()})
	}
}
