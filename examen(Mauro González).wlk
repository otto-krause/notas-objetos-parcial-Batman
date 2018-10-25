//Correccion: 2
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos

object batman{
	var vitalidad=800
	var estres=8
	var fuerza
	method combatirVillanos(){
		
		estres+=1
	}
	method llorarPadres(){
		
		estres-=10
	}
	method estresado(){
		return estres>15
	}
	method bailar(){
		vitalidad+=100
	}
}
class Tecnologia{
	var potencia
	var nombre=[]
	var usos
	method poderArma(){
		return potencia/usos
	}
	method moda(){
    return nombre.startsWith("bati")
	}
}
class Villanos{
	var fuerza
	var delitosl
	var delitosp
	var cvillanos=[]
	method cantitdadMaldad(){
		fuerza+=delitosl
	}
	method tipoMaldad(){
		
	}
	method profugos(){
		
	}
}
class Gotica{
	var habitantes=[]
	var capital
	method esLujosa(){
		
	}
	method losTop(){
		
	}
}