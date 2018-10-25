//Correccion: 3
//Se nota la falta de practica y falta de comprension del dominio
object batman {
	
	var rinionera = []
	var vida = 800
    var estres = 8
    var fuerza 
    var poderT
      	
      	method desarrollarTecnologia(nombreT, potenciaT, cantUso){
      		
      		rinionera.add(nombreT, potenciaT, cantUso)
      		//Habia que hacer una clase para la tecnologia
      		
      	}
      	method poderTecnologia( potenciaT, cantUso){  
      		
      		poderT = potenciaT / cantUso
      		rinionera.add(poderT)
      	}
      	
     
      	
  method llorar (){
  	
  	estres = estres - 10
  	rinionera = rinionera - 1//Esto no quita un objeto de la rinionera 
  }    	
  
method estaEstresado(){
	return estres > 15
	}

method suFuerza(){
	
	fuerza = vida + poderT
}

method combatirCrimen(fuerzaVillano){

return fuerza > fuerzaVillano 
}

method estaDeModa(){

	return rinionera.startsWith({ r => rinionera == "bati"}).all()
	//Era al reves, primero el all y el startsWith adentro 
}

method bailar(usoHerramienta){
	
	if(usoHerramienta == "batiTwist"){
		vida += 100
	
	}
	//No se necesita haber usado la herramienta para bailar
}

}

class Villanos {
	var maldades= []
	var fuerzaVillano
		var villanos = []	
	
	
	method esPsicopata(){
	
	return  maldades.count({m => maldades == "matar"}) > 5
	}
	method fuerzaPsicopatas (inteligencia){
		fuerzaVillano = inteligencia * maldades.size()
			villanos.add(fuerzaVillano)
	}	

	method esLadronGuanteBlanco(){
		return maldades.all({m => maldades == "RobarRicos"})
	}
method esLadronGuanteMarron(){
	return maldades.any({m => maldades == "RobarMedia" })
} 	
	method fuerzaLadrones(){
		fuerzaVillano = maldades.size()
		villanos.add(fuerzaVillano)
	}
	
		method suFuerza(){
		return fuerzaVillano
	
	}
}


class CiudadGotica inherits Villanos {
	

	var habitantes = []
	var profugos = []

	
	method esRico(dinero){
		return dinero > 5000000
	}
    method esMedia(dinero){
	return dinero > 1000000 && dinero < 5000000
    } 
    method esPobre (dinero){
	return dinero < 1000000
}

method realizarMaldad(){
	return profugos.anyOne()
}
//Ciudad Gotica no realiza maldades, los villanos las hacen
method esLujosa (){
	return habitantes.count({ h => h.esRico()}) > (habitantes.size()/2)
}
method sonLosMasTop (){
	return habitantes.sortedBy({h1, h2 => h1.habitantes > h2.habitantes}).take(10)
}

}

