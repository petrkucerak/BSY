from itertools import combinations

import unicodedata


def remove_accent(text):
    """
    Remove accent from text
    :param text: text to remove accent from
    :return: text without accent
    """
    return unicodedata.normalize('NFKD', text).encode('ASCII', 'ignore').decode('utf-8', 'ignore')


surnames = [
    "Šembera",
    "Boháč",
    "Fabinger",
    "Havlas",
    "Jelínek",
    "Konrád",
    "Pokorný",
    "Řezníček",
    "Schmidt",
    "Vavřina",
    "Brodský",
    "Certin",
    "Herrmann",
    "Jícha",
    "Jirásek",
    "Ledvinka",
    "Lustig",
    "Musil",
    "Novák",
    "Novotný",
    "Postránecký",
    "Přibyslavský",
    "Říhánek",
    "Šulc",
    "Veselý",
    "Záhorský",
    "Baberkov",
    "Beneš",
    "Bláha",
    "Cenčić",
    "Diviš",
    "Dudek",
    "Ehrlich",
    "Fontán",
    "Grunt",
    "Hambálek",
    "Hartl",
    "Hassdenteufel",
    "Hauf",
    "Havlíček",
    "Houser",
    "Kabelík",
    "Karásek",
    "Karl",
    "Karlovský",
    "Kindl",
    "Kořínek",
    "Kraus",
    "Kulda",
    "Majcen",
    "Marván",
    "Rozsypal",
    "Sáblík",
    "Schier",
    "Schulz",
    "Schworm",
    "Smíšek",
    "Stjepanek",
    "Suchánek",
    "Svoboda",
    "Šícha",
    "Urbánek",
    "Vančura",
    "Vochoč",
]

# Generate all combinations of the surnames
surname_combinations = list(combinations(surnames, 2))

# Print the generated combinations
for combination in surname_combinations:
    print(combination[0]+combination[1])
    print(remove_accent( combination[0])+remove_accent(combination[1]))

