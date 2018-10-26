//Correccion: 3
object batman{
	var estres=8
	var vitalidad=800
	var batirinonera=[]
	method estaEstresado(){
		return estres>15
	}
	method llorar(){
		estres-=10
		batirinonera.anyone().clear()
		//Clear funciona solo para listas
	}
	method estademoda(){
		batirinonera.dnombre("bati")
		//El metodo dnombre no esta definido
	}
	method creartecnologia(n,p,c){
		batirinonera.add(new Tecnologia(n,c,p))
	}
	method combatircrimen(){
		estres++
		//No cumple con lo pedido en el enunciado
	}
	method fuerza(){
		batirinonera.sum({b=>b.poder()})
		//return vitalidad + batirinonera.sum({b=>b.poder()})
	}
	method restarvitalidad(){
		vitalidad-=200
	}
	method batitwist(){
		vitalidad+=100
	}
	//No realiza el metodo estaEstresado
}
class Villanos{
	var estado="conciente"
	method realizarmaldad()
	method fuerza()
	method estarinconsiente(){
		estado="inconciente"
	}
}
class Psicopata inherits Villanos{
	var cantasesinatos
	method asesinar(){
		return -5
	}
	 override method realizarmaldad(){
	 	cantasesinatos+=5
	}
	override method fuerza(){
		return cantasesinatos
	}
}
class Ladron inherits Villanos{
	var cantmaldades
	 override method fuerza(){
		return cantmaldades
	}
	method robar(cant){
		return -cant
	}
}
class Ladrongb inherits Ladron{
	override method realizarmaldad(){
		cantmaldades++
	}
	method ladron(){
		return "lb"
	}
}
class Ladrongm inherits Ladron{
	override method realizarmaldad(){
		cantmaldades++
	}
	method ladron(){
		return "lm"
	}
}
class Pandilla{
	var integrantes=[]
	
	
	method crearladrongm(){
		integrantes.add([new Ladrongm()])
	}
	method crearladrongb(){
		integrantes.add([new Ladrongb()])
	}
	method crearpsicopata(){
		integrantes.add([new Psicopata()])
	}
	//Estos metodos para crear ladrones no son requeridos, y agregarlos adentro de los corchetes es agregar una lista, porque lo que el mensaje no funciona
	
	
	
	
 	method inconcientetodalap(){
		integrantes.estarinconcientes()
	}
	method realizarmaldades(){
		integrantes.realizarmaldades()
	}
	method fuerza(){
		integrantes.fuerza().sum()
	}
	//Ninguno de estos metodos utiliza un correcto uso de las funciones de listas
	
}
class Tecnologia{
	var nombre
	var cantusos
	var potencia
	constructor (n,c,p){
		nombre=n
		cantusos=c
		potencia=p
	}
	method poder(){
		return potencia/cantusos
	}
	method dnombre(){
		return nombre
	}
}
object ciudadgotica{
	var baticaballero=batman
	var ciudadanos=[]
	var villanosprofugos=[]
	method crearladrongm(){
		villanosprofugos.add([new Ladrongm()])
	}
	method crearladrongb(){
		villanosprofugos.add([new Ladrongb()])
	}
	method crearpsicopata(){
		villanosprofugos.add([new Psicopata()])
	}
	method crearpandilla(){
		
	}
	method topciudadanos(){
		return ciudadanos.sortedBy({a1, a2 => a1.devolvercapital() > a2.devolvercapital()}).take(10)
	}
	method eslujosa(){
		return ciudadanos.count({h=>h.estadodelciudadano()=="es clase rica"})
		//No dice si es mas de la mitad de la poblacion.
		//Comparar con un string no es lo mejor.
	}
	method villanosatacan(cant){
		villanosprofugos.realizarmaldad()
		ciudadanos.anyone(villanosprofugos.asesinar()).clear()
		ciudadanos.anyone().perdercapital(villanosprofugos.robar(cant))
	}
	//Era un comportamiento de la pandilla, no de la ciudad
	method combatircrimen(){
		var villanoscontrabatman=villanosprofugos.anyone()
		if(baticaballero.fuerza()>villanoscontrabatman.fuerza()){
		villanoscontrabatman.count().times(baticaballero.combatircrimen())
		villanoscontrabatman.estarinconsiente()
		villanosprofugos-=villanoscontrabatman
		}
		else{
			villanoscontrabatman.count().times(baticaballero.combatircrimen())
			baticaballero.restarvitalidad()
		}
		//Combatir el crimen es un comportamiento de Batman, no de gotica
	}
	method mostrarvillanosp(){
		console.println(villanosprofugos)
	}
	//Habia que devolver una lista, no mostrarlos por pantalla
}
class Ciudadano{
	var capital
	constructor (c){
		capital=c
	}
	method devolvercapital(){
		return capital
	}
	method estadodelciudadano(){
		 return if(capital>5000000)"es clase rica"else if(capital>1000000)"es clase media" else "es clase baja"
}
	method perdercapital(cant){
		capital-=cant
	}
}
