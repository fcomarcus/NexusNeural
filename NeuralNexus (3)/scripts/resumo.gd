
extends Control

func _ready():
    var file = FileAccess.open("res://data/progresso.json", FileAccess.READ)
    if file:
        var dados = JSON.parse_string(file.get_as_text())
        file.close()
        var texto = "Fase atual: %s
Empatia: %d
Controle: %d
Autonomia: %d" % [
            dados.get("fase_atual", "menu"),
            dados.get("empatia", 0),
            dados.get("controle", 0),
            dados.get("autonomia", 0)
        ]
        $LabelResumo.text = texto
