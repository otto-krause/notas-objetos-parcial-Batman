//Correccion: 2
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos
//Atributos innecesarios en todas las clases
class Tecnologias{
	var rinionera=[]//la rinionera era un atributo de Batman
	var potencia
	var nombre
	var usos
	var tecnologia
	constructor(p,n,u,r,t){
		potencia=p
		nombre=n
		usos=u
		rinionera=r
		tecnologia=t
	}
	method poder(){
		return potencia/usos
	}
	method guardartecnologia(){
		rinionera+=tecnologia
	}	
}



class Batman{
	var estres
	var fuerza
	var vida
	var herramientas
	var prof
	var tecnologias
	var poderpandilla
	var podervillano
	//Herramientas y tecnologias no son lo mismo?
	
	constructor(e,f,v,h,p,t,pp,pv)
	{
		estres=e
		fuerza=f
		vida=v
		herramientas=h
		prof=p
		tecnologias=t
		poderpandilla=pp
		podervillano=pv
	}
	method pelear(){

		var cantvillanos=[]
		if (fuerza>poderpandilla){
			estres+=cantvillanos
			
			var pandillainconsciente
			return pandillainconsciente
			//Porque devuelve esto?
		}
		else
		{
			var villanosprofugos=true
			prof++
			//Que es prof?
			return vida-200
		}
		//No funciona
	}
	method estaEstresado(){
		return estres>15
	}
	method baticaballero(){
		var vitalidad=800
		var estresbaticaballero=8
		var fuerzabaticaballero
		return fuerzabaticaballero+=herramientas
	}
	//No declarar variables dentro de un metodo
	method llorar(){
		herramientas.remove(1)
		estres-10
	}
	method bailar(){
		return vida+100
	}
	method batmanestaalamoda(){
		
	
	}
		

}


object psicopatas{//Porque un object?
	var poblacionciudad
	var fuerza
	var inteligencia
	var cantidadasesinatos
	method fuerzatotal(){
		return inteligencia*cantidadasesinatos
	}
	method atacar(){
		return poblacionciudad-5
	}
}

class Ladrones{
		var dineroladronB
		var dineroladronN
		var fuerza
		var maldad
		var habClasAlta
		var habClasMed
		constructor(db,dn,f,m,ha,hm){
			dineroladronB=db
			dineroladronN=dn
			fuerza=f
			maldad=m
			habClasAlta=ha
			habClasMed=hm
		}
	method robanladronB(cantidad){
		habClasAlta-=cantidad
		dineroladronB+=cantidad
		maldad++
	}

	method robanladronN(cantidad){
		habClasMed-=cantidad
		dineroladronN+=cantidad
		maldad++
	}
	
	method fuerzaladron(){
		return maldad
	}
}
//Incompleto
object ciudadgotica{
	var pob=[]
	var rica
	method esLujosa(){
		return pob/2>rica
	}
	method sonLosMasTop(){
		return pob.sortedby{a,b=>a<b}.take(10)
	}
	method villanosprofugos(prof){
		return prof	
	}
}




