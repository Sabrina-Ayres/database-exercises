USE bank_db;

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
  id INT UNSIGNED,
  date DATE,
  description VARCHAR(100),
  memo TEXT,
  amount DECIMAL NOT NULL,
  transaction_successful TINYINT,
  PRIMARY KEY (id)
);

