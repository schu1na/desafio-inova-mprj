import sys
import os

# Adiciona o diretório raiz do projeto ao path do Python
# Isso permite executar o script de qualquer lugar (raiz do projeto ou pasta src)
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

try:
    from src.database import get_db_connection
except ImportError:
    from database import get_db_connection

def test():
    print("Tentando conectar ao banco de dados...")
    conn = get_db_connection()
    if conn:
        print("Conexão bem sucedida!")
        
        try:
            cur = conn.cursor()
            cur.execute("SELECT current_date;")
            result = cur.fetchone()
            print(f"Data do servidor: {result[0]}")
            cur.close()
            conn.close()
        except Exception as e:
            print(f"Conectou, mas falhou ao executar query: {e}")
    else:
        print("Falha na conexão. Verifique as credenciais no .env")

if __name__ == "__main__":
    test()
