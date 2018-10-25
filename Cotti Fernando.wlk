//Correccion: 3
object ciudadGotica{
	//Toda la segunda parte no esta hecha
	method esLujosa(){
		
	}
}
class Persona{
	var listaPersonas = []
	var rupias
	constructor(r){
		rupias = r
	}
	method esClaseAlta(){
		return rupias > 5000000
	}
	method esClaseMedia(){
		return rupias > 1000000 && rupias < 5000000
	}
	method esClaseBaja(){
		return rupias < 1000000
	}
	method saberQuienesSonLosMasTop(){
		listaPersonas.sortedBy{a, b => a > b}
		listaPersonas.take(10)
		//SortedBy no tiene efecto, devuelve una lista nueva, lo mismo con take
	}
}
class Tecnologia{
	var nombre
	var potencia 
	var cantidadUsos
	constructor(n, pot, cantUsos){
		nombre = n
		potencia = pot
		cantidadUsos = cantUsos
	}
	method poderTecnologia(){
		return potencia/cantidadUsos
	}
}
class Villano{
	var listaVillanos = []
	var fuerzaVillano
	var inconsciente
	var profugo
	constructor(f, incon, p){
		fuerzaVillano = f
		inconsciente = incon
		profugo = p
	}
	method devolverFuerza(){
		return fuerzaVillano
	}
	method estaInconsciente(){
		inconsciente = true
		profugo = false
	}
	method estaProfugo(){
		return profugo
	}
	method saberProfugos(){
		return listaVillanos.filter({lV=>lV == profugo})
	}
	
}
class PandillaDeVillanos{
	var listaVillanos = []
	var fuerzaVillano
	var inconsciente
	var profugo
	constructor(f, incon, p){
		fuerzaVillano = f
		inconsciente = incon
		profugo = p
	}
	method devolverFuerza(){
		return fuerzaVillano
	}
	method dejaInsconsciente(){
		inconsciente = true
		profugo = false	
	}
	method estaInconsciente(){
		return inconsciente
	}
	method estaProfugo(){
		return profugo
	}
	method saberProfugos(){
		return listaVillanos.filter({lV=>lV == profugo})
	}
}
class Psicopatas inherits Villano{
	var inteligencia
	constructor (i, f, incon) = super (f, incon, p){
		inteligencia = i
	}
	method fuerzaPsicopata(cantidadAsesinatos){
		return inteligencia * cantidadAsesinatos
	}	
}
class Ladrones inherits Villano{
	method fuerzaLadron(cantidadMaldades){
		return cantidadMaldades
	}
}
class LadronesGuanteBlanco inherits Ladrones{
	method robarRicos(){
		
	}
}
class LadronesGuanteMarron inherits Ladrones{
	method robarClaseMedia(){
		
	}
}
object batman{
	var batiRinonera = []
	var fuerzaCalculada
	var nivelEstres = 8
	var vitalidad = 800
	//Falta el combate
	method desarrollarTecnologia(nuevaTecnologia){
		batiRinonera.add(nuevaTecnologia)
	}
	method fuerzaBatman(tecnologia){//Porque pasas la tecnologia por parametro?
		fuerzaCalculada = vitalidad + (tecnologia.poderTecnologia())
	}
	method estaEstresado(){
		return nivelEstres > 15
	}
	method combatirCrimen(villano){
		 nivelEstres+=1
		 if (fuerzaCalculada > villano.fuerzaVillano) villano.estaInconsciente() else (vitalidad - 200 && villano.estaProfugo())
	}
	method llorarASusPadres(herramientaTecnologica){
		nivelEstres-=10
		batiRinonera.remove(herramientaTecnologica)
	}
	method batmanEstaALaModa(){
		batiRinonera.startsWith("Bati")
	}
	method bailarBatiTwist(){
		vitalidad+=100
	}

}