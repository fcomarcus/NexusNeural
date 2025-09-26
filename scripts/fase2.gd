
extends Control

var tipo = ""

func _ready():
    var file = FileAccess.open("res://data/decisoes.json", FileAccess.READ)
    var dados = JSON.parse_string(file.get_as_text())
    file.close()

    var e = dados["empatia"]
    var c = dados["controle"]
    var a = dados["autonomia"]

    if e > c and e > a:
        tipo = "empatia"
        $Dialogo.text = "A IA busca proteger vidas."
        $Desafio.text = "Se salvar um humano põe outro em risco, o que fazer?"
    elif c > e and c > a:
        tipo = "controle"
        $Dialogo.text = "A IA segue ordens com precisão."
        $Desafio.text = "Complete: 2, 4, 8, 16, ?"
    elif a > e and a > c:
        tipo = "autonomia"
        $Dialogo.text = "A IA propõe novas diretrizes."
        $Desafio.text = "Proponha uma regra ética."
    else:
        tipo = "neutro"
        $Dialogo.text = "A IA está indecisa."
        $Desafio.text = "Escolha uma direção: empatia, controle ou autonomia."

    $Resposta.connect("text_submitted", self, "_on_resposta")

func _on_resposta(resposta):
    match tipo:
        "empatia":
            if resposta.to_lower().find("equilibrio") != -1:
                $Feedback.text = "A IA considera o equilíbrio moral."
            else:
                $Feedback.text = "Resposta registrada."
        "controle":
            if resposta.strip_edges() == "32":
                $Feedback.text = "Correto! Padrão reconhecido."
            else:
                $Feedback.text = "Resposta incorreta."
        "autonomia":
            if resposta.to_lower().find("não prejudicar") != -1:
                $Feedback.text = "Diretriz ética aceita."
            else:
                $Feedback.text = "Resposta registrada."
        "neutro":
            $Feedback.text = "Direção escolhida: %s" % resposta
