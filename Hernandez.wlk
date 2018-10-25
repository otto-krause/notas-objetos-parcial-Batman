//Correccion: 7
object ciudadGotica
{
	var habitantes = []
	var villanos = []
	
	method esLujosa()
	{
		return habitantes.count({h => h.esRica()}) > (habitantes.size() / 2)
	}
	method sonLosMasTop()
	{
		return habitantes.sortedBy({h1, h2 => h1.capital() > h2.capital()}).take(10)
	}
	method asesinarHabitantes(cantidadAsesinados)
	{
		habitantes.remove(habitantes.take(cantidadAsesinados))
		//La idea estaba bien, pero tenias que usar removeAll
	}
	method robarHabitantesRicos(cantidadRobada)
	{
		habitantes.filter({h => h.esRico()}).forEach({h => h.serRobado(cantidadRobada)})
	}
	method robarHabitantesClaseMedia(cantidadRobada)
	{
		habitantes.filter({h => h.esClaseMedia()}).forEach({h => h.serRobado(cantidadRobada)})
	}
	method villanosProfugos()
	{
		return villanos.filter({v => v.estaProfugo()})
	}
}

object batman
{
	var vitalidad = 800
	var estres = 8
	var batiRinonera = []
	
	method combatirCrimen(enemigo)
	{
		if (self.fuerza() > enemigo.fuerza())
			enemigo.forEach({e => e.quedarInconsciente()})//No pasan por parametro una lista
		else
			vitalidad = (vitalidad - 200).max(0)
			//falta que quede profugo
		estres += enemigo.cantidadAAtacar()
	}
	method desarrollarNuevaTecnologia(nombre, potencia, cantidadUsos)
	{
		batiRinonera.add(new Tecnologia(nombre, potencia, cantidadUsos))
	}
	method llorarPorSusPadres()
	{
		estres = (estres - 10).max(0)
		batiRinonera.remove(batiRinonera.last())
	}
	method fuerza()
	{
		return vitalidad + batiRinonera.sum({b => b.poder()})
	}
	method estaEstresado()
	{
		return estres > 15
	}
	method estaALaModa()
	{
		return batiRinonera.all({b => b.startsWith("Bati")})//b.nombre().startsWith("bati")
	}
	method bailarBatiTwist()
	{
		vitalidad += 100
	}
}

class Tecnologia
{
	var nombre
	var potencia
	var cantidadUsos
	
	//La cantidad de usos empieza en 0, no hacia falta pasarlo por constructor
	constructor(nom, pot, cantUs)
	{
		nombre = nom
		potencia = pot
		cantidadUsos = cantUs
	}
	
	method poder()
	{
		return potencia / cantidadUsos
	}
}

class Villano
{
	var profugo
	
	constructor ()
	{
		profugo = true
	}
	
	method fuerza()
	method realizarMaldad()
	method cantidadAAtacar()
	{
		return 1
	}
	method estaProfugo()
	{
		return profugo
	}
	method quedarInconsciente()
	{
		profugo = false
	}
}

class Psicopata inherits Villano
{
	var cantAsesinatos
	var inteligencia
	
	constructor(int) = super()
	{
		inteligencia = int
		cantAsesinatos = 0
	}
	
	override method fuerza()
	{
		return inteligencia * cantAsesinatos
	}
	override method realizarMaldad()
	{
		ciudadGotica.asesinarHabitantes(5)
		cantAsesinatos += 5
	}
}

class DeGuanteBlanco inherits Villano
{
	var cantMaldades
	
	constructor() = super()
	{
		cantMaldades = 0
	}
	
	override method fuerza()
	{
		return cantMaldades
	}
	override method realizarMaldad()
	{
		ciudadGotica.robarHabitantesRicos(1000000)
		cantMaldades++
	}
}

class DeGuanteMarron inherits DeGuanteBlanco
{
	constructor() = super()
	
	override method realizarMaldad()
	{
		ciudadGotica.robarHabitantesClaseMedia(1000000)
		cantMaldades++
	}
}

class Pandilla inherits Villano
{
	var villanos = []
	
	override method realizarMaldad()
	{
		villanos.forEach({v => v.realizarMaldad()})
	}
	override method fuerza()
	{
		return villanos.sum({v => v.fuerza()})
	}
	override method cantidadAAtacar()
	{
		return villanos.size()
	}
}

class Habitante
{
	var capital
	
	constructor(cap)
	{
		capital = cap
	}
	
	method esRico()
	{
		return capital > 5000000
	}
	method esClaseMedia()
	{
		return capital > 1000000
	}
	method capital()
	{
		return capital
	}
	method serRobado(cantidadRobada)
	{
		capital -= cantidadRobada
	}
}