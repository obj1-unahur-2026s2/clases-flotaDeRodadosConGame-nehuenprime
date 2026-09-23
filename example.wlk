object ChevroletCorsa {
    const capacidad = 4
    const velocidadMaxima = 150
    const peso = 1300
    var color = "rojo"

    method capacidad() = capacidad
    method velocidadMaxima() = velocidadMaxima
    method peso() = peso
    method color() = color
}

object RenaultKwid {
    var tanqueAdicional = false
    const capacidad = 4
    const velocidadMaxima = 120
    const peso = 1200
    const color = "azul"

    method capacidad() = if(!tanqueAdicional) capacidad else capacidad - 1
    method velocidadMaxima() = if(!tanqueAdicional) 110 else velocidadMaxima
    method peso() = if(tanqueAdicional) peso + 150 else peso
    method color() = color
}

object trafic {
    var interior = interiorComodo
    var motor = motorPulenta

    method capacidad() = motor.capacidad()
    method velocidadMaxima() = motor.velocidadMaxima()
    method peso() = 4000 + interior.peso() + motor.peso()
    method color() = "blanco"

    method cambiarInterior(nuevoInterior) {
      interior = nuevoInterior
    }
    method cambiarMotor(nuevoMotor) {
      motor = nuevoMotor
    }
}
object interiorComodo {
  const capacidad = 5
  const peso = 700
}
object interiorPopular {
  const capacidad = 12
  const peso = 1000
}
object motorPulenta {
  const peso = 800
  const velocidadMaxima = 130
}
object motorBataton {
  const peso = 500
  const velocidadMaxima = 80
}


object especiales {
    //  clases
}

class dependencia {
  var rodados = []
  var empleados = 0

  method agregarAFlota(rodado) {
      rodados.add(rodado)
    }
    method quitarDeFlota(rodado) {
      rodados.remove(rodado)
    }
    method pesoTotalFlota() {
      return rodados.sum({rodado => rodado.peso()})
    }
    method estaBienEquipada() {
      return rodados.size() > 3 && rodados.all({rodado => rodado.velocidadMaxima() >= 100})
    }
    method capacidadTotalEnColor(color) {
      return rodados.filter({rodado => rodado.color() == color}).sum({rodado => rodado.capacidad()})
    }
    method colorDelRodadoMasRapido() {
      return rodados.max({rodado => rodado.velocidadMaxima()}).color()
    }
    method capacidadFaltante() {
      return empleados - rodados.sum({rodado => rodado.capacidad()})
    }
    method esGrande() {
      return empleados >= 40  &&  rodados.size() >= 5
    }
}