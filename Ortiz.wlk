//Correccion: 2
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos

object batman inherits Tecnologia{//Porque Batman hereda de tecnologia?
	var fuerza = vitalidad + self.poder()
	var vitalidad = 800
	var estres = 8
	method estaEstresado(){
		return estres > 15
	}
	method combatirCrimen(villanos){
		
		}
		
	method esModa(){
		nombre.startsWith("Bati")
	}//No funciona
	
	method habilidad(){
		return vitalidad+=100
	}
	
	method bailar(baile){
		return "Bati-Twist"
	}
}

class Tecnologia{
	var nombre=[]
	var potencia=[]
	var cantUsos=[]

	method poder(){
		return potencia/cantUsos
	}
}

class Villanos{
	var cantMaldades=[]
	var fuerza
	var asesinatos
	var inteligencia
	var cantVillanos=[]
	constructor(m,f,a,i,v){
		cantMaldades=m
		fuerza=f
		asesinatos=a
		inteligencia=i
		cantVillanos=v
	}
	method Psicopatas(){
		cantMaldades.times({a=>asesinatos.times(5)})
		fuerza=inteligencia*asesinatos
	}
}

class Ladrones{
	var cantMaldades=[]
	method GuanteBlanco(){
		
	}
}

class Pandilla inherits Villanos{
	var maldades
	method esPandilla(){
		return cantVillanos>3	
	}
	
	method RealizaMaldades(){
		return maldades>0
	}
}

class Poblacion{
	var ciudadanos=[]
	var dinerototal
	constructor(c,d){
		ciudadanos=c
		dinerototal=d
	}
	method esLujosa(){
		return dinerototal>5000000
	}
	
	method Ordenado(){
		dinerototal.sortedby({c=>c.MasTop()})
	}
	method Top(){
		ciudadanos.take(10)
	}
}