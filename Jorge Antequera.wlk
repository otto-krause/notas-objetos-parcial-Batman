//Correccion: 2
//No cumple los requisitos minimos de aprobacion, por no realizar mas del 50% de los requerimientos

class Tecnologias{
	var nombre=[]
	var potencia
	var cantUsos
	var poder
	constructor(p,c,n){
		cantUsos=c
		poder=p
		nombre=n
	}
	method potencia(p,c){
		return p/c
	}
	method batiRinonera(n){
		return n
	}
}
class Batman{
	var vitalidad=800
	var estres=8
	var pelea
	var moda
	var fuerza
	method poder(potencia){
		vitalidad+=potencia
		return fuerza
	}
	method llorar(){
		return estres-=10
	}
	method combatirCrimen(){ 
	}
}
object villanos{
	var maldades=[]
	var tipo=[]
	var cantvillano
	method fuerzavillano(){
		return maldades+=1
	} 
	method villanoS(){
		return cantvillano>1
	}	
}
