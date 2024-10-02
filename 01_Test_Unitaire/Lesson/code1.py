def total(liste):
    """ renvoie la somme des éléments d'une liste """

    # to make fail the test on type of arguments
    #if type(liste) == int :
    #    return (liste)

    result : float = 0.0

    for item in liste:
        result += item

    return (result)