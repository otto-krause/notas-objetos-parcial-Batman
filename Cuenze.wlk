//Correccion: 2
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos

object batman{
	var vitalidad=800
	var estres=8
	method estasEstresado(){
		return estres>15
	}
	method batiTwist(){
		vitalidad+=100
	}
	method llorarPadres(){
		estres-=10
	}
	method fuerza(){
		return vitalidad
	}
	method combatirelcrimen(){
		
	}
	method estaAlaModa(n){
		return n.startsWith("bati")
	}
}
class Tecnologias{
	var nombre=[]
	var potencia=[]
	var cantuso=[]
	constructor(n,p,c){
		nombre=n
		potencia=p
		cantuso=c
	}
	method calcularPoder(p,c){
		return p/c
	}
}
class Psicopata{
	var inteligencia
	var asesinatos
	
	method hacermaldad(){
		return asesinatos+=5
	}
	method fuerza(){
		return inteligencia*asesinatos
	}
}
class Ladron{
	method hacermaldad(){
		
	}
}
object habitantes{
	var cantDinero
	method 
}