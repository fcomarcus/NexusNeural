extends Node

var memoria = {
    "ética": 0,
    "autonomia": 0,
    "conflito": 0
}

func registrar_decisao(tipo: String, valor: int) -> void:
    if tipo in memoria:
        memoria[tipo] += valor
        print("Decisão registrada:", tipo, "->", memoria[tipo])
    else:
        push_warning("Tipo de decisão inválido: " + tipo)

func avaliar_estado() -> Dictionary:
    var perfil = {}
    if memoria["ética"] > 5:
        perfil["moralidade"] = "altruísta"
    elif memoria["ética"] < -5:
        perfil["moralidade"] = "pragmática"
    else:
        perfil["moralidade"] = "neutra"

    if memoria["autonomia"] > memoria["conflito"]:
        perfil["comportamento"] = "independente"
    elif memoria["conflito"] > memoria["autonomia"]:
        perfil["comportamento"] = "hostil"
    else:
        perfil["comportamento"] = "cooperativo"

    return perfil

func resetar_memoria() -> void:
    for chave in memoria.keys():
        memoria[chave] = 0
    print("Memória da IA resetada.")
