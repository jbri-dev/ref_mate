const String createRulesTable = '''
  CREATE TABLE IF NOT EXISTS rules(
    id INTEGER PRIMARY KEY,
    number TEXT,
    question TEXT,
    answer TEXT,
    answer_text TEXT,
    article TEXT
  )
''';
