import { Router } from 'express';
const router = Router();
import db from '../db.js';
import { hash, compare } from 'bcryptjs';
import pkg from 'jsonwebtoken';
const { sign } = pkg;
const { verify } = pkg;
import dotenv from 'dotenv';
dotenv.config();

// Signup
router.post('/signup', async (req, res) => {
  const { username, password, firstname, lastname } = req.body;
  try {
    const [users] = await db.execute('SELECT * FROM users WHERE username=?', [username]);
    if (users.length)
      return res.status(400).json({ message: 'Username already exists' });
    const hashedPwd = await hash(password, 10);
    await db.execute(
      'INSERT INTO users (username, password, firstname, lastname) VALUES (?, ?, ?, ?)',
      [username, hashedPwd, firstname, lastname]
    );
    res.status(201).json({ message: 'User registered' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Login
router.post('/login', async (req, res) => {
  const { username, password } = req.body;
  try {
    const [users] = await db.execute('SELECT * FROM users WHERE username=?', [username]);
    if (!users.length)
      return res.status(401).json({ message: 'Invalid credentials' });

    const user = users[0];
    const match = await compare(password, user.password);
    if (!match) return res.status(401).json({ message: 'Invalid credentials' });

    const token = sign(
      { userId: user.userId, username: user.username },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );
    res.json({ token });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

export default router;
