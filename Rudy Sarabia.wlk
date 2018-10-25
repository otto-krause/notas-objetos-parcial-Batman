//Correccion: 4
object batman{
	var batiRin = []
	var stress = 0
	var vitalidad = 1000
	//La vitalidad empezaba en 800
	method combatirElCrimen(){
		//No combate el crimen
	}
	
	method desarrollarNuevasTec(nom, pot, cU){
		batiRin.add(new NuevaTec(nom,pot,cU))
	}
	method llorarPadres(){
		stress = stress - 10
		batiRin.remove(batiRin.AnyOne())
	}
	method estaEstresado(){
		return stress>15
	}
	method bailarBatiTwist(){
		vitalidad = vitalidad + 100
	}
	//No dice si Batman esta a la moda
}
class NuevaTec{
	var nombre
	var potencia
	var usos
	constructor(nom,pot,cU){
	//la cantidad de usos empieza en 0, no hacia falta pasarlo por constructor
		nombre = nom
		potencia = pot
		usos = cU
	}
	method calcularPoder()
	{
		return potencia/usos
	}
}
//Falta la clase abstracta Villano
class VillanoPsicopata{
	var inteligencia = 100 //para qur no quede vacío
	var cant_mal = 0
	var profugo = true
	method realizar_maldad(){
		ciudadGotica.hab_asesxPsicopata()
		cant_mal = cant_mal+1
	}
	method mostrarFuerza(){
		return inteligencia*cant_mal
	}
	method estaProfugo(){
		return profugo
	}
}
class VillanoLadron{
	var cant_mal = 0
	method realizar_maldad()
	method mostrarFuerza(){
		return cant_mal
	}
}
//No estan desarrollados los guantes
class Ladron_GBlanco inherits VillanoLadron{
	override method realizar_maldad(){
	}
}
class Ladron_GMarron{
	
}
class Pandillas{
	var integrantes = []
	
	//La clase no tiene que crear los villanos, se los tiene que pasar
	constructor(){
		self.aniadir_VillanoPSI()
		2.times(self.aniadir_VillanoGB())
		2.times(self.aniadir_VillanoGM())
	}
	method aniadir_VillanoPSI(){
		integrantes.add(new VillanoPsicopata())
	}
	method aniadir_VillanoGB(){
		integrantes.add(new Ladron_GBlanco())
	}
	method aniadir_VillanoGM(){
		integrantes.add(new Ladron_GMarron())
	}
	
}
object ciudadGotica{
	var habitantes = []
	var villanos = []
	var pandillas = []
	method aniadir_VillanoPSI(){
		villanos.add(new VillanoPsicopata())
	}
	method aniadir_Pandilla(){ //no podia especificar integrantes aleatorios
		pandillas.add(new Pandillas())
	}
	method aniadir_VillanoGM(){
		villanos.add(new Ladron_GMarron())
	}
	method aniadir_VillanoGB(){
		villanos.add(new Ladron_GBlanco())
	}
	method aniadir_habitante(dinero){
		habitantes.add(new Habitantes(dinero))
	}
	method hab_asesxPsicopata(){
		4.times(habitantes.remove(habitantes.anyOne()))
	}
	method habitantesSonRobados(){
		habitantes.forEach({habit => habit.ser_robados()})
	}
	method esLujosa(){
		return habitantes.length()/2 <= habitantes.count({hab=>hab.sonRicos()})
	}
	method hab_sonLosMasTop(){
		return ((habitantes.map({hab=>hab.esRico()})).sortedby({hab1, hab2 => hab1>hab2})).take(10)
		//El map esta demas
	}
	method profugos(){
		return villanos.map({v=>v.estaProfugo()})
		//Map devuelve una lista de resultados
	}
}
class Habitantes{
	var dinero
	constructor(d){
		dinero = d
	}
	method ser_robados(){
		dinero = dinero - 500000
	}
	method sonRicos(){
		return dinero >= 5000000
	}
	method sonClaseMedia(){
		return 1000000 >=  dinero && dinero <5000000
	}
	method sonClaseBaja(){
		return not self.sonClaseMedia()
	}
}