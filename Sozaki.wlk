//Correccion: 9
object ciudadGotica{
	var ciudadanos = []
	var villanos = []
	
	method esLujosa(){
		return ciudadanos.count({c=>c.esRico()}) > ((ciudadanos.length() / 2).roundUp ())
	}
	method topCiudadanos(){
		return (ciudadanos.sortBy({c1,c2 =>c1.capital()<c2.capital()})).take(10)
		//Ordenaste por menor
	}
	method profugos(){
		return villanos.filter({v=>v.estaProfugo()})
	}
	method ciudadanosRicos(){
		return ciudadanos.filter({c=>c.esRico()})
	}
	method ciudadanosMedios(){
		return ciudadanos.filter({c=>c.esClaseMedia()})
	}
	method eliminarCiudadanos(cantCiudadanos){
		ciudadanos.drop(cantCiudadanos)
		//Drop devuelve una nueva lista, no modifica
	}
}
class Ciudadano{
	var dinero
	
	constructor(d){
		dinero =d
	}
	
	method capital(){
		return dinero
	}
	
	method esRico(){
		return dinero>5000000
	}
	
	method esClaseMedia(){
		return dinero>1000000 && dinero< 5000000
	}
	method serRobado(){
		dinero = 0
	}
}

object batman{
	var vitalidad = 800
	var estres = 8
	var batiRinonera = []
	
	method combatirCrimen(villano){
		estres += villano.cantVillanos()
		batiRinonera.foreach({t=>t.usar()})//Habia que hacerlo al final, sino estas calculando mal la fuerza 
		if(villano.fuerza()>self.fuerza()) 
		vitalidad =0.max(vitalidad-200) && villano.quedarProfujo()//PORQUE EL &&???
		 else villano.quedarInconsciente() 
	}
	
	method desarrollarTecnologia(n,p){
		batiRinonera.add(new Tecnologia(n,p))
	}
	
	method llorar(){
		estres = 0.max(estres-10)
		batiRinonera.remove(batiRinonera.anyOne())
	}
	
	method fuerza(){
		return vitalidad + (batiRinonera.sum({p=>p.poder()}))
	}
	
	method estaEstresado(){
		return estres>15
	}
	method estaALaModa(){
		return batiRinonera.count({t=>t.estaALaModa()}) == batiRinonera.length() 
	}
	method bailar(){//habia que bailar el BATIWIST
		vitalidad +=100
	}
}

class Tecnologia{
	var nombre
	var potencia
	var cantUsos
	
	constructor(n,p){
		nombre = n
		potencia = p
		cantUsos = 0
	}
	method poder(){
		return potencia / cantUsos
	}
	
	method estaALaModa(){
		return nombre.startsWith("Bati")
	}
	method usar(){
		cantUsos ++
	}
}

class Villano{
	var inconsciente
	var profugo
	
	constructor(p){
		inconsciente = false
		profugo = p
	}
	method realizarMaldad()
	method fuerza()
	method quedarInconsciente(){
		inconsciente = true
		profugo = false
	}
	method quedarProfugo(){
		profugo = true
	}
	method estaProfugo(){
		return profugo
	}
	method cantVillanos(){
		return 1
	}
}

class Psicopata inherits Villano{
	var cantAsesinatos
	var inteligencia
	
	constructor(p,a,inte) = super(p){
		cantAsesinatos = a
		inteligencia = inte
	}
	
	override method realizarMaldad(){
		ciudadGotica.eliminarCiudadanos(5)
		cantAsesinatos += 5
	}
	override method fuerza(){
		return inteligencia * cantAsesinatos
	}
}

class Ladron inherits Villano{
	var guante
	var cantMaldades
	constructor(p,g,cm) = super(p){
		guante = g
		cantMaldades = cm
	}
	override method realizarMaldad(){
		cantMaldades++
		guante.robar()
	}
	override method fuerza(){
		return cantMaldades
	}
	method cambiarGuante(nuevoGuante){
		guante = nuevoGuante
	}
}

object guanteBlanco{
	method robar(){
		(ciudadGotica.ciudadanosRicos()).foreach({c=>c.serRobado()})
	}
}
object guanteMarron{
	method robar(cantRobada){
		(ciudadGotica.ciudadanosMedios()).foreach({c=>c.serRobado()})
	}
}

class Pandilla{
	var listaVillanos= []
	
	constructor(v){
		listaVillanos = v
	}
	
	method realizarMaldades(){
		listaVillanos.foreach({v=>v.realizarMaldad()})
	}
	method fuerza(){
		return listaVillanos.sum({v=>v.fuerza()})
	}
	method quedarInconsciente(){
		listaVillanos.foreach({v=>v.quedarInconsciente()})
	}
	method quedarProfujo(){
		listaVillanos.foreach({v=>v.quedarProfujo()})
	}
	method cantVillanos(){
		return listaVillanos.length()
	}
}