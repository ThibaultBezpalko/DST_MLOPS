from wallet import Wallet, InsufficientAmount
import pytest

@pytest.fixture
def empty_wallet():
    return Wallet()

@pytest.fixture
def wallet_100():
    return Wallet(100)

def test_initial_balance_zero(empty_wallet):
    assert(empty_wallet.balance) == 0

def test_initial_balance_amount(wallet_100):
    assert(wallet_100.balance) == 100

def test_add_cash():
    wallet = Wallet(10)
    wallet.add_cash(90)
    assert(wallet.balance) == 100

def test_spend_cash():
    wallet = Wallet(20)
    wallet.spend_cash(10)
    assert(wallet.balance) == 10

def test_insufficient_amount(wallet_100):
    with pytest.raises(InsufficientAmount):
        wallet_100.spend_cash(150)

@pytest.mark.parametrize("earned,spent,expected", [(30, 10, 20), (20, 2, 18)])
def test_transactions(empty_wallet, earned, spent, expected):
    empty_wallet.add_cash(earned)
    empty_wallet.spend_cash(spent)
    assert empty_wallet.balance == expected
