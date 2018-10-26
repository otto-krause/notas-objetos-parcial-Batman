//Correccion: 6
class NuevaTecnologia
{
	var nombre
	var potencia
	var cantidadUsos
	//No era necesario pasar la cantidad de usos por constructor
	constructor(n,p,c)
	{
		nombre = n
		potencia = p
		cantidadUsos = c
	}
	method Nombre()
	{
		return nombre
	}
	method Poder()
	{
		return potencia/cantidadUsos
	}
}

class Villano
{
	var cantidadMaldades
	var profugo
	var inteligencia
	var consciente
	var guante
	constructor (i,color)
	{
		consciente = true
		cantidadMaldades = 0
		profugo = false
		inteligencia = i
		guante = color
	}
	method VolverProfugo()
	{
		profugo = true
	}
	method EstaProfugo()
	{
		return profugo
	}
	method PerderConsciencia()
	{
		consciente = false
		//Falta hacer que profugo quede en false
	}
	method Fuerza()
	method SerCombatido(batman)//Batman es un object, porque pasarlo por parametro?
	{
		if (batman.fuerza()>self.Fuerza())
		{
			self.PerderConsciencia()		}
		else
		{
			self.VolverProfugo()
			batman.ReducirVida(200)
		}
	}
	method RealizarMaldad(gotica)//Gotica es un object, no hace falta el parametro
}
class Pandilla
{
	var miembros
	constructor(m)
	{
		miembros = m	
	}
	method EstaProfugo()
	{
		return miembros.All({m=>m.EstaProfugo()})
	}
	method Fuerza()
	{
		return miembros.sum({m=>m.Fuerza()})
	}
	method SerCombatido(batman)
	{
		if (batman.fuerza()>self.Fuerza())
		{
			miembros.forEach({v=>v.PerderConsciencia()})
		}
		else
		{
			miembros.forEach({v=>v.VolverProfugo()})
			batman.ReducirVida(200)
		}
		//Estas repitiendo la logica de villano
	}
	method RealizarMaldad(gotica)
	{
		miembros.forEach({v=>v.RealizarMaldad(gotica)})
	}
}
class VillanoPsicopata inherits Villano
{
	constructor (i,color) = super(i,color)
	override method Fuerza()
	{
		return inteligencia * cantidadMaldades
		//Nunca se modifica la cantidad de maldades
	}
	override method RealizarMaldad(gotica)
	{
		5.times(gotica.matarHabitante())
	}
}
class VillanoLadron inherits Villano
{
	constructor (i,color) = super(i,color)
	override method Fuerza()
	{
		return cantidadMaldades
		//Nunca se modifica la cantidad de maldades
	}
	override method RealizarMaldad(gotica)
	{
		guante.robar(gotica)
	}
}
object guanteMarron
{
	method Robar(gotica)
	{
		gotica.Habitantes().filter({h=>h.esMedio()}).forEach({h=>h.SerRobado()})
		//Se podia delegar mucha logica a gotica
		//Por ejemplo: gotica.claseMedia().forEach({h=>h.SerRobado()})
		//O tal vez: gotica.robarALaClaseMedia()
		//Lo mismo en el guante blanco
	}
}
object guanteBlanco
{
	method Robar(gotica)
	{
		gotica.Habitantes().filter({h=>h.esRico()}).forEach({h=>h.SerRobado()})
	}
}
class Habitante
{
	var dinero
	constructor (d)
	{
		dinero = d
	}
	method EsRico()
	{
		return dinero >= 5000000
	}
	method EsMedio()
	{
		return (dinero >= 1000000) && (dinero <50000000)
	}
	method Plata()
	{
		return dinero
	}
	method SerRobado()
	{
		dinero = 0
	}
}
object ciudadGotica
{
	var habitantes = []
	var villanos = []
	method EsLujosa()
	{
		return (habitantes.count({h=>h.esRico()})) > (habitantes.size()/2)
	}
	method MatarHabitante()
	{
		habitantes.remove(habitantes.anyOne())
	}
	method Top10()
	{
		return habitantes.sortedBy({h1,h2 => h1.Plata()>h2.Plata()}).take(10)	
	}
	method MostrarProfugos()
	{
		return villanos.filter({v=>v.EstaProfugo()})
	}
	method Habitantes()
	{
		return habitantes
	}
}
object batman
{
	var batiRinonera = []
	var vitalidad = 800
	var estres = 8
	method PerderVida(cantidad)
	{
		vitalidad-=cantidad
	}
	method EstaEstresado()
	{
		return estres>15
	}
	method EstaALaModa()
	{
		return batiRinonera.All({b=>b.nombre().startsWith("bati")})
	}
	method Fuerza()
	{
		return vitalidad + batiRinonera.sum({b=> b.poder()})
	} 
	method BailarBatiTwist()
	{
		vitalidad += 100
	}
	method CombatirCrimen(objetivo) 
	{
		estres+= objetivo.size()
		//Esto no funciona, la pandilla no tiene size ni el villano tampoco
		objetivo.forEach({v => v.serCombatido(self)})
		//Esto solo funcionaria si te pasan una lista de villanos, por parametro
	}
	method LlorarPadres()
	{
		batiRinonera.remove(batiRinonera.anyOne())
		estres -= 10
	}
	method DesarrollarTecnologia(nombre,potencia)
	{
		batiRinonera.add(new NuevaTecnologia(nombre,potencia,0))
	}
}
