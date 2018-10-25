//Correccion: 3
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos
//Se nota la falta de practica, poco manejo de las funciones de listas

object batman {
	var batiwea=[]
	var estres=8
	var vida=800
	var aux=0
	method combatirCrimen(pandilla){

		if (self.poderBatman<fuerzaVill)//Que es fuerzaVill?
		vida-=200
		return cantIntegrantes.times({estres+=1})
	}
	method desarrollarNuevasTec(nombre,potencia){
		batiwea.add(new NewTec(nombre,potencia,0))
	}
	method llorarasusViejos(){
		estres-=10
		batiwea.remove(1)
	}
	method estaEstresado(){
		return estres>15
	}
	method poderTotalDesuBatiwea(){
		return aux+=batiwea.potencia
		//No se calcula asi
	}//Cuidado con los nombres de los metodos
	method poderBatman(){
		return vida+self.poderTotalDesuBatiwea
	}
	method batiTwist(){
		vida+=100
	}
	method estoyAlaModa(){
		return batiwea.startsWith("bati")
	}//Las listas no entienden ese mensaje
}

class NewTec{
	var nombre
	var potencia
	var cantUsos
	constructor(n,p,c){
		nombre=n
		potencia=p
		cantUsos=c
	}
	method calcularPoder(){
		return potencia/cantUsos
	}
}

class Villano{
	var cantMaldades=0
	method hacerMaldad(){
		cantMaldades+=1
	}
	method fuerzaVill(){
		return cantMaldades
	}
}

class VillanoPsicopata inherits Villano{
	var inteligencia
	var cantAsesinatos=0
	override method hacerMaldad(){
		cantAsesinatos+=5	
		//No hace cambios en la ciudad
	}
	override method fuerzaVill(){
		return inteligencia*cantAsesinatos
	}
}

class Ladrones inherits Villano{
	
}

class Pandilla inherits Villano{
	var villanes=[]
	constructor(cv){
		villanes=cv
	}
	method cantIntegrantes(){
		return villanes.size()
	}
	override method fuerzaVill(){
		return villanes.fuerzaVill
	}//No funciona, hay que usar funciones de listas
}

class Ciudadano{
	var dinero
	method esRico(){
		return dinero>5000000
	}
	method esClaseMedia(){
		return dinero<5000000 && dinero>1000000
	}
	method esClaseBaja(){
		return dinero<1000000
	}
}

object ciudadGotica {
	var ciudan=[]
	method esLujosa(ciudadano){
		return ciudan.count({c=>c.esRico})>ciudan.count({c=>c.esClaseMedia}) && ciudan.count({c=>c.esRico})>ciudan.count({c=>c.esClasebaja})
	}
	method sonLosMasTop(){
		ciudan.sortBy()
		return ciudan.take(10)
	}
}