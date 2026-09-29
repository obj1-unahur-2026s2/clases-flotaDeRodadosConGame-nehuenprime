class ChevroletCorsa {
    const capacidad = 4
    const velocidadMaxima = 150
    const peso = 1300
    const color 

    method capacidad() = capacidad
    method velocidadMaxima() = velocidadMaxima
    method peso() = peso
    method color() = color
}

class RenaultKwid {
    var tanqueAdicional = false
    const capacidad = 4
    const velocidadMaxima = 120
    const peso = 1200
    const color = "azul"

    method capacidad() = if(!tanqueAdicional) capacidad else capacidad - 1
    method velocidadMaxima() = if(!tanqueAdicional) 110 else velocidadMaxima
    method peso() = if(tanqueAdicional) peso + 150 else peso
    method color() = color
    method ponerTanque() {
      tanqueAdicional = true
    }
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

  method capacidad() = capacidad
  method peso() = peso
}
object interiorPopular {
  const capacidad = 12
  const peso = 1000

  method capacidad() = capacidad
  method peso() = peso
}
object motorPulenta {
  const peso = 800
  const velocidadMaxima = 130

  method peso() = peso
  method velocidadMaxima() = velocidadMaxima
}
object motorBataton {
  const peso = 500
  const velocidadMaxima = 80

  method peso() = peso
  method velocidadMaxima() = velocidadMaxima
}


object especial {
    //  clases
}

class Dependencia {
  const rodados = []
  const empleado

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
    return empleado - rodados.sum({rodado => rodado.capacidad()})
  }
  method esGrande() {
    return empleado >= 40  &&  rodados.size() >= 5
  }
}

class Pedido {
  const pedidos = []

  var distancia
  var tiempoMaximo
  var cantidadPasajeros
  var coloresIncompatibles

  method distancia() = distancia
  method tiempoMaximo() = tiempoMaximo
  method cantidadPasajeros() = cantidadPasajeros
  method coloresIncompatibles() = coloresIncompatibles

  method velocidadRequerida() = distancia / tiempoMaximo
  method puedeSatisfacer(rodado) {
    return rodado.velocidadMaxima() >= self.velocidadRequerida() + 10 && rodado.capacidad() >= cantidadPasajeros && !coloresIncompatibles.contains(rodado.color())
  }
  method acelerar() {
    tiempoMaximo -= 1
  }
  method relajar() {
    tiempoMaximo += 1
  }

  method agregarPedido(pedidoNuevo) {
    pedidos.add(pedidoNuevo)
  }
  method quitarPedidos(pedidoASacar) {
    pedidos.remove(pedidoASacar)
  }
  method totalDePasajeros() {
    return pedidos.sum({pedido => pedido.cantidadPasajeros()})
  }

}


