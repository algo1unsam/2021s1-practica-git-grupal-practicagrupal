import pepita.*
import wollok.game.*
import niveles.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(alguien) {
		game.say(alguien, "¡¡Ahora a descansar!!")
		self.detenerGravedad(config)
		game.schedule(5000, { game.stop()})
	}

	method detenerGravedad(configure) {
		configure.DetenerEventosTiempo("GRAVEDAD")
	}

}

object silvestre {

	method image() = "silvestre.png"

	method position() = game.at(pepita.position().x().max(3), 0)

	method teEncontro(alguien) {
		game.say(self, "¡¡Que rica paloma!!")
		self.detenerGravedad(config)
		game.schedule(5000, { game.stop()})
	}

	method detenerGravedad(configure) {
		configure.DetenerEventosTiempo("GRAVEDAD")
	}

}

