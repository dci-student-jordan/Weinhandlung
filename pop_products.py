
import mysql.connector

def pop_prods(prod):
    scanDB = mysql.connector.connect(
        host="localhost",
        user="root",
        database="Weinhandel"
    )
    cursor = scanDB.cursor()
    cursor.execute("INSERT INTO shop_product VALUES (NULL, %s, %s, %s, %s)", (prod['name'], prod['description'], prod['price'], prod['stock'],))

    scanDB.commit()
    cursor.close()
    scanDB.close()

products = [
    {
        "name": "Château Grand Cru",
        "description": "A full-bodied, rich and velvety wine with notes of blackcurrant, plum, and chocolate. Aged in oak barrels for 15 years, it pairs well with red meat, game, and strong cheeses.",
    },
    {
        "name": "Vineyard Gold Reserve",
        "description": "An elegant and complex wine with a bouquet of honey, green apple, and a hint of vanilla. Perfect for seafood, poultry, and light pasta dishes.",
    },
    {
        "name": "Estate Platinum Selection",
        "description": "A sophisticated and intense wine with flavors of dark cherry, raspberry, and mocha. Excellent with grilled meats, hearty stews, and dark chocolate.",
    },
    {
        "name": "Orchard Silver Label",
        "description": "A light and crisp wine with flavors of pear, peach, and a hint of honeydew. Ideal for salads, light pasta dishes, and seafood.",
    },
    {
        "name": "Villa Ruby Reserve",
        "description": "A vibrant and fruity wine with notes of strawberry, cherry, and a hint of rose. Perfect for poultry, pork, and vegetarian dishes.",
    },
    {
        "name": "Sunset Valley Merlot",
        "description": "A smooth and medium-bodied wine with notes of black cherry, plum, and a hint of chocolate. Perfect for red meat, poultry, and cheese.",
    },
]

if __name__ == '__main__':
    for prod in products:
        pop_prods(prod)