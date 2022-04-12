const express = require('express');
const router = express.Router();

const customerController = require('../controllers/customerController');

router.get('/', customerController.list);
router.post('/add', customerController.save);
router.get('/update/:idusers', customerController.edit);
router.post('/update/:idusers', customerController.update);
router.get('/delete/:idusers', customerController.delete);

module.exports = router;