import pkg from 'jsonwebtoken';
const { verify } = pkg;

import dotenv from 'dotenv';
dotenv.config();

export default function (req, res, next) {
  const authHeader = req.headers['authorization'];
  if (!authHeader) return res.status(401).json({ message: 'No auth header' });
  const token = authHeader.split(' ')[1];
  if (!token) return res.status(401).json({ message: 'No token' });
  try {
    const decoded = verify(token, process.env.JWT_SECRET);
    req.user = decoded; // userId, username
    next();
  } catch (err) {
    res.status(401).json({ message: 'Invalid/expired token' });
  }
};
