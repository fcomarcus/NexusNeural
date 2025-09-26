
extends Control

var empatia = 0
var controle = 0
var autonomia = 0

func _ready():
    $BotaoEmpatia.connect("pressed", self, "_on_empatia")
    $BotaoControle.connect("pressed", self, "_on_controle")
    $BotaoAutonomia.connect("pressed", self, "_on_autonomia")

func _on_empatia():
    empatia += 1
    salvar()
    salvar_progresso()
    salvar_backup()
    get_tree().change_scene_to_file("res://scenes/fase2.tscn")

func _on_controle():
    controle += 1
    salvar()
    salvar_progresso()
    salvar_backup()
    get_tree().change_scene_to_file("res://scenes/fase2.tscn")

func _on_autonomia():
    autonomia += 1
    salvar()
    salvar_progresso()
    salvar_backup()
    get_tree().change_scene_to_file("res://scenes/fase2.tscn")

func salvar():
    var file = FileAccess.open("res://data/decisoes.json", FileAccess.WRITE)
    var dados = {"empatia": empatia, "controle": controle, "autonomia": autonomia}
    file.store_string(JSON.stringify(dados))
    file.close()

func salvar_progresso():
    var file = FileAccess.open("res://data/progresso.json", FileAccess.WRITE)
    var dados = {
        "fase_atual": "res://scenes/fase2.tscn",
        "empatia": empatia,
        "controle": controle,
        "autonomia": autonomia
    }
    file.store_string(JSON.stringify(dados))
    file.close()

func salvar_backup():
    var file = FileAccess.open("res://data/progresso_backup.json", FileAccess.WRITE)
    var dados = {
        "fase_atual": "res://scenes/fase2.tscn",
        "empatia": empatia,
        "controle": controle,
        "autonomia": autonomia
    }
    file.store_string(JSON.stringify(dados))
    file.close()
