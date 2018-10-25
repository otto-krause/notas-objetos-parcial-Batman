//Correccion: 2
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos

//batman//
object batman{
	var fuerza
	var vitalidad=800
	var estres_inicial=8
	var cant_tecnologia
	var sumanivel_estres
	var restanivel_estres
	var cant_villano
	
	
	method Desarrollar(){
		return cant_tecnologia+=1
	}
	
	method Combatir_villano(){
		
		cant_villano+=1
	}
	method Combatir_pandilla(){
		
		cant_villano+=1
	}
	method sumaEstres(){
		sumanivel_estres=cant_villano
		return sumanivel_estres
	}
	method Llorar(){
		
	return restanivel_estres-=10	
		
	}
	method estaEstresado(){
		
		return (estres_inicial+sumanivel_estres-restanivel_estres)>15
	}
}

//tecnologia//
object tecnologia{
	var nombre 
	var potencia
	var cant_usos	
	var poder
	
	method poderHerramienta(){
		poder=potencia/cant_usos 
		return poder 
	}
	
	
	
}

//villanos//

object Villano{
	var cant_villano = []
	var cant_maldad
	var fuerza
}
object psicopata{
	var inteligencia
	var asesinatos
	method realizarMaldad(){
		cant_maldad = asesinatos/5
		}
		
	}
	
	object ladron_blanco{
		
		
	}
	object ladron_marron{
		
}



//riqueza habitantes//
class Habitante{
	var capital
	var cant_habiantes=[]
	
	
}

object ciudad_gotica{
	method esLujosa(){
			
	}	
}
