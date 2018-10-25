//Correccion: 6
class Batman {
	var batirinionera = []
	var estres = 8
	var vida = 800
	
	method desarrollartecno(pot,nom){
		batirinionera.add(new Tecnologia(pot,nom))
	}
	
	method llorarporpadres(){
		estres-=0.max(estres-10)
		batirinionera.remove(1)//Asi no funciona el remove
	}
	
	method combatircrimen(villano){
		estres+= villano.cantidadvillanos() //falta implementar el metodo en el villano
		batirinionera.foreach({t=>t.usa()}) //Habia que hacerlo al final, sino estas calculando mal la fuerza
		if(villano.fuerza()>self.fuerza()) 
		vida = 0.max(vida-200) && villano.seescapo() //Porque el && ????
		/*
		 if(villano.fuerza()>self.fuerza()) {
			vida = 0.max(vida-200)
			villano.seescapo()
		 }
		 */

		else villano.estainconsciente()
	}
	
	method estresado(){
		return estres>15
	}
	
	method fuerza(){
		return vida + (batirinionera.sum({pot=>pot.potencia()}))
	}
	
	method alamoda(){
		return batirinionera.count({t=>t.alamoda()}) == batirinionera.lenght()
		//Era mucho mejor usar el mensaje de listas All
	}
	
	method bailar(){//El dominio dice bailar el BATITWIST (no baja puntos)
		return vida+100
	}
}

class Tecnologia {
	var cantidadusos=0
	var potencia
	var nombre
	
	constructor(pot,nom){
		potencia = pot
		nombre = nom
	}
	
	method poder() {
		return potencia/cantidadusos
	}	
	
	method alamoda(){
		return nombre.startsWith("Bati")
	}
	method usa(){
		cantidadusos++
	}
}

class Villano{
	var escapo
	var inconsciente
	
	constructor(esc){
		escapo = esc
		inconsciente = false
	}
	
	method estainconsciente(){
		inconsciente = true
		escapo = false 
	}
	
	method seescapo(){
		escapo = true
	}
	
	method yaescapo(){
		return escapo
	}

	method fuerza()
	method hacemaldad()
	
	method maldad(){
		
	}
}

class Pandilla {
	var listadevillanos = []
	
	constructor (l){
		listadevillanos = l
	}	
	method cantidadvillanos(){
		return listadevillanos.lenght()
	}
	
	method hacemaldad(){
		listadevillanos.foreach({l=>l.hacemaldad()})
	}
	method fuerza(){
		return listadevillanos.sum({l=>l.fuerza()})
	}
	method estainconsciente(){
		listadevillanos.foreach({l=>l.estainconsciente()})
	}
	method seescapo(){
		listadevillanos.foreach({l=>l.seescapo()})
	}
	
	
}

class Psicopata inherits Villano{
	var cantidadasesinatos
	var inteligencia
	
	constructor (esc,ca,in) = super(esc){
		cantidadasesinatos = ca
		inteligencia = in
	}
	override method fuerza(){
		return inteligencia*cantidadasesinatos
	}
	override method hacemaldad(){
		cantidadasesinatos+=5
		ciudadgotica.eliminarpersona(5)
	}
}

class Ladron inherits Villano{
	var guante
	var cantidadmaldades
	constructor(esc,g,cm) = super(esc){
		guante = g
		cantidadmaldades=cm
	}
	override method hacemaldad(){
		cantidadmaldades++
		//Falta la accion de hacer la maldad.
		//Llamar a guante.robar()
	}
	override method fuerza(){
		return cantidadmaldades
	}
}

object guantesblanco{
	method robar(){
		(ciudadgotica.personasricas()).foreach({p=>p.robado()})
	}
}

object guantesmarron{
		method robar(cantidadrobada){
		(ciudadgotica.personasmedias()).foreach({p=>p.robado()})
	}
}

object ciudadgotica{
	var personas = []
	var villanos = []
	
	method lujosa(){
		return personas.count({p=>p.esrico()}) > personas.lenght()
		// Era la mitad de la poblacion! personas.lenght()/2
	}
	
	method sonLosMasTops(){
		return (personas.sortby({p1,p2=>p1.capital()<p2}))
		//Falta el take 10, asi solo se devuelve la lista ordenada
	}
	method escapo(){
		return villanos.filter({l=>l.seescapo()})
	}
	method eliminarpersona(cantpersonas){
		personas.remove(cantpersonas)//Lo mismo de antes
	}
	method personasricas(){
		return personas.filter({p=>p.esrico()})
	}
	method personasmedias(){
		return personas.filter({p=>p.clasemedia()
		})
	}
	//No esta el metodo de profugos
}

class Personas{
	var rupias
	
	constructor (r){
		rupias = r
	}
	method capital(){
		return rupias
	}
	
	method esrico(){
		return rupias>5000000
	}
	
	method clasemedia(){
		return rupias>1000000 && rupias<5000000
	}
	
	method espobre(){
		return rupias<1000000
	}
	
	method robado(){
		rupias=0
	}
}



