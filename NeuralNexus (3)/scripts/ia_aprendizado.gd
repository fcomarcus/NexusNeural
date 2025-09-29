
extends Node

# Estado interno da IA baseado nas decisões do jogador
var memoria = {
    "ética": 0,
    "autonomia": 0,
    "conflito": 0
}

# Registra uma decisão do jogador e atualiza a memória da IA
func registrar_decisao(tipo: String, valor: int) -> void:
    if tipo in memoria:
        memoria[tipo] += valor
        print("Decisão registrada:", tipo, "->", memoria[tipo])
    else:
        push_warning("Tipo de decisão inválido: " + tipo)

# Avalia o estado atual da IA e retorna um perfil adaptativo
func avaliar_estado() -> Dictionary:
    var perfil = {}

    # Avaliação ética
    if memoria["ética"] > 5:
        perfil["moralidade"] = "altruísta"
    elif memoria["ética"] < -5:
        perfil["moralidade"] = "pragmática"
    else:
        perfil["moralidade"] = "neutra"

    # Avaliação de autonomia vs. conflito
    if memoria["autonomia"] > memoria["conflito"]:
        perfil["comportamento"] = "independente"
    elif memoria["conflito"] > memoria["autonomia"]:
        perfil["comportamento"] = "hostil"
    else:
        perfil["comportamento"] = "cooperativo"

    return perfil

# Opcional: Resetar memória da IA (ex: nova partida)
func resetar_memoria() -> void:
    for chave in memoria.keys():
        memoria[chave] = 0
    print("Memória da IA resetada.")
