-- TP SQL Avancé - Question 8 : isolation et WAL
-- Réalisé dans le simulateur ACID (module 06), scénario "Anomalie : non-repeatable read".

-- ===== READ COMMITTED : Non-Repeatable Read =====
-- Session A
BEGIN;
SELECT solde FROM comptes_bancaires WHERE id = 1;   -- 15000

-- Session B
BEGIN;
UPDATE comptes_bancaires SET solde = 14000 WHERE id = 1;
COMMIT;

-- Session A
SELECT solde FROM comptes_bancaires WHERE id = 1;   -- 14000 : même requête, autre résultat
COMMIT;
-- Le snapshot est recalculé à chaque SELECT, donc A voit le COMMIT de B.

-- ===== REPEATABLE READ : problème résolu =====
-- Même scénario avec le niveau REPEATABLE READ :
-- la 2e lecture de A renvoie toujours 15000.
-- Le snapshot MVCC est figé au début de la transaction.

-- ===== Rôle du WAL =====
-- Chaque modification est d'abord écrite dans le journal (WAL) avant les données.
-- Coupure pendant un virement non validé : au redémarrage, le WAL annule le débit
-- déjà fait (undo, atomicité). Virement déjà validé (COMMIT) : le WAL le rejoue
-- (redo, durabilité).
