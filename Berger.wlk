//Correccion: 2
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos
object batman{
	var vitalidad=800
	var estres=8
	var fuerza
	var tecnologia
	method herramientas(){
		var potencia=100
		var cantidadUsos=6	
	}
	method fuerzaTotal(){
		fuerza=(vitalidad+)
	}
	method estaEstresado(){
		estres>15
	}
	method combatirVillano(){
		estres+=1
	}
	method llorar(){
		estres-=10
		tecnologia-=1
	}
	method bailar(){
		vitalidad+=100
	}
}
object psicopata{
	var vida=300
	var fuerza
	var muertes
	var inteligencia=20
	method asesinar(){
		muertes+=5
	}
	method fuerzaTotal(){
		fuerza=(inteligencia*muertes)
	}
	method atacarSolo(){
		
	}
	method atacaPandilla(){
		
	}
}
object ladron{
	var vida=200
	var fuerza
	var maldad
	method guanteBlanco(){
		maldad+=10
	}
	method guanteMarron(){
		maldad+=7
	}
	method atacarSolo(){
				
	}
	method atacaPandilla(){	
	}
}
