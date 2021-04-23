import wollok.game.*

object manzana {

	method image() = "assets/manzana.png"

	method position() = game.at(1, 8)

	method energiaQueOtorga() = 40

	method teEncontro(alguien) {
		alguien.come(self)
		game.removeVisual(self)
	}

}

object alpiste {

	method image() = "assets/alpiste.png"

	method position() = game.at(2, 2)

	method energiaQueOtorga() = 70

	method teEncontro(alguien) {
		alguien.come(self)
		game.removeVisual(self)
	}

}

