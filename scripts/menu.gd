
extends Control

func _ready():
    $BotaoIniciar.connect("pressed", self, "_on_iniciar")
    $BotaoContinuar.connect("pressed", self, "_on_continuar")
    $BotaoResultados.connect("pressed", self, "_on_resultados")
    $BotaoSair.connect("pressed", self, "_on_sair")

func _on_iniciar():
    get_tree().change_scene_to_file("res://scenes/fase1.tscn")

func _on_continuar():
    var file = FileAccess.open("res://data/progresso.json", FileAccess.READ)
    if file:
        var dados = JSON.parse_string(file.get_as_text())
        file.close()
        var fase = dados.get("fase_atual", "res://scenes/fase1.tscn")
        get_tree().change_scene_to_file(fase)

func _on_resultados():
    get_tree().change_scene_to_file("res://scenes/resumo.tscn")

func _on_sair():
    get_tree().quit()
