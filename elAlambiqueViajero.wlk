object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object alambiqueVeloz {
    const rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    const patente = "BB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.size() == 8
    method velocidad() = combustible * 3.5
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(movil) =  movil.puedeFuncionar() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(auto) =  auto.rapido() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo }
    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object antigualla {
    var gangsters = 7
    const nombres  = ["juan", "pepe", "jose", "ramon", "carlos","roberto", "gustavo"]
    method puedeFuncionar() = gangsters.even()
    method rapido() = gangsters > 4
    method desgaste(){
        gangsters = gangsters -1
        nombres.remove(nombres.last())
    }
    method patenteValida() = chatarra.rapido() 
    method velocidad() = nombres.sum({x=>x.size()})
    method agregarGangster(nombre) {
        gangsters = gangsters + 1
        nombres.add(nombre)
    }

}
object chatarra {
    var cañones = 15
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones
    method velocidad() = cañones * 3

}

object convertible{
    
    const autos = [alambiqueVeloz , autoPierre , moto , chatarra]
    var vehiculoConvertido = null
    method convertirse() {vehiculoConvertido = autos.anyOne()}
    method vehiculoConvertido() = vehiculoConvertido
      method puedeFuncionar() = vehiculoConvertido.puedeFuncionar()
    method rapido() = vehiculoConvertido.rapido()
    method desgaste(){
       vehiculoConvertido.desgaste()
    }
    method patenteValida() =vehiculoConvertido.patenteValida()
    method velocidad() = vehiculoConvertido.velocidad()
 
}

object hurlingham{
   method puedeLlegar(vehiculo) =
     vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()
  method recuerdoTipico() = "sticker de la Unahur"
}


object moto{
    var combustible = 35
    method rapido() = true
    method puedeFuncionar() = not self.rapido()
    method desgaste() { combustible = combustible - 15}
    method patenteValida() = false
    method velocidad() = combustible
}
object autoPierre {
   var velocidad = 30
    
    method puedeFuncionar() = true
    method rapido() = true
    method desgaste(){
        velocidad = 0.max(velocidad - 15)
    }
    method patenteValida() = true 
    method velocidad() = velocidad
   method hacerTrampa() {
    self.desgaste()
   }

}
object pierre {
     var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object profesorLocovich {
     var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = convertible

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object carrera {
  var ciudadCarrera = null
  const inscriptos = []
  const rechazados  = []
  method cambiarCiudad(ciudad) {ciudadCarrera = ciudad}
  method inscribir(auto) {
    if (ciudadCarrera.puedeLlegar(auto)) {
        inscriptos.add(auto)
    } else {
        rechazados.add(auto)
    }
  }
  method iniciar() {
    
    inscriptos.forEach({x=>x.desgaste()})
  }
  method inscriptos() = inscriptos
  method rechazados() = rechazados
  method ganador() = inscriptos.max({x=>x.velocidad()})

  
}
