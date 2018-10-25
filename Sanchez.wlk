//Correccion: 3
//Se nota la falta de practica
object batman{
var estres = 8
var herramientas = []
var vitalidad = 800
var fuerza = vitalidad + herramientas.sum(p)
//La fuerza se calculaba en un metodo, no en una variable

method desarrollarTecnologias(){
	herramientas.add(new Herramienta(n, po, c, p))
}

method estaEstresado(){
	return estres>15	
}		
	
method combatirCrimen(fuerzaV) {
		if(fuerza>fuerzaV){
			Villano.estaInconsciente()
			//De donde sale el villano?
		}
		else
		{
			Villano.estaProfugo()
			vitalidad-=200
		}	
		estres++
		//No funciona para una pandilla de villanos
	}
	

method llorarASusPadres(){
	estres-=10
	herramientas.take(herramientas.size()-1)//No aplica efecto
}


method estaALaModa(){
	 herramientas.startsWith("bati")
	 //Habia que usar la funcion de listas All
}

method bailar(){
	vitalidad+=100	
}

}

class Herramienta{
	var nombre
	var potencia
	var cantUsos
	var poder = potencia/cantUsos
	//Esto se calcula en un metodo, no el variable. Otra vez.
	constructor(n,po,c,p){
		nombre=n
		potencia=po
		cantUsos=c
		poder=p
	}
	
}

class Villano{
	var nombre
	var fuerzaV
	var villanos = []
	constructor(n,f,v){
		nombre=n
		fuerzaV=f
		villanos=v
	}
	
	method realizaMaldad(){
		
	}
	
	method estaSolo(){
		villanos.size() == 1
	}
	
	method esPandilla(){
		villanos.size()>1	
	}

	method estaInconsciente(){
		
	}

	method estaProfugo(profugos){
		profugos.add(nombre)
	}

}


class Psicopata inherits Villano{
	var inteligencia
	var cantAsesinatos	
	constructor(i,c) = super(n,f,v) {
		inteligencia=i
		cantAsesinatos=c
	}
	
	override method realizaMaldad(){
        cantAsesinatos+=5	
        //No realiza cambios en la ciudad
	}
	
}

class Ladron inherits Villano{
	var cantMaldades
	constructor(ca)  = super(n,f,v){
		cantMaldades= ca
	}	
}

class GuanteBlanco inherits Ladron{
	
	method robar(){
		//Falta logica
	}
}

class GuanteMarron inherits Ladron{
	
	 method robar(){
		//Falta logica		
	}
	
}

class CiudadGotica{
	var habitantes = []
	var profugos = []
	constructor(h){
		habitantes=h
	}
	
	method esLujosa(){
		habitantes.size()/2.esRico()
		//No funciona
	}

	method sonLosMasTop(){
		//No realiza
	}
	
	method villanosProfugos(){
		return profugos
	}

}

class Habitante {
	var nombre
	var dinero
	constructor(d){
		dinero=d
	}
	
	method esRico(){
		return dinero>5000000
	}
	
	method esClaseMedia(){
		
		return dinero >1000000 && dinero<5000000
	}
	
	method esClaseBaja(){
		
		return dinero<1000000
	}

}
