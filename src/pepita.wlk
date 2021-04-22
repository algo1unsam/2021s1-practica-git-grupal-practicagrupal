import extras.*
import wollok.game.*

//Pepita
object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" else if (self.estaConSilvestre() or self.estaSinEnergia()) "pepita-gris.png" else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		// restrinjo la posicion para que pepita no salga de la pantalla
		// cuando se topa con el nido, silvestre o se queda con energia detengo el movimiento. (no entra en el if)
		if (self.DentroDelRangoDeMovilidad(nuevaPosicion) and self.sinEnergiaNoEstaEnNidoNoEstaConSilvestre()) {
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
		}
	}

	method DentroDelRangoDeMovilidad(nuevaPosicion) {
		return nuevaPosicion.x() >= 0 and nuevaPosicion.x() <= 9 and nuevaPosicion.y() >= 0 and nuevaPosicion.y() <= 9
	}

	method sinEnergiaNoEstaEnNidoNoEstaConSilvestre() {
		return not self.estaSinEnergia() and not self.estaEnElNido() and not self.estaConSilvestre()
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}

	method estaConSilvestre() {
		return position == silvestre.position()
	}

	method estaSinEnergia() {
		return self.energia() < 0
	}

	method caerSiEstasVolando() {
		if (not self.estaEnElSuelo()) {
			position = position.down(1)
		}
	}

	method estaEnElSuelo() {
		return position.y() == 0
	}

}

