const controller = {};

controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM users', (err, users) => {
            if (err) {
                res.json(err);
            }
            res.render('users', {
                data: users
            });
        });
    });
};

controller.save = (req, res) => {
    const data = req.body;
    console.log(req.body)
    req.getConnection((err, connection) => {
      const query = connection.query('INSERT INTO users set ?', data, (err, user) => {
        console.log(user)
        res.redirect('/');
      })
    })
  };
  controller.edit = (req, res) => {
    const { idusers } = req.params;
    req.getConnection((err, conn) => {
      conn.query("SELECT * FROM users WHERE idusers = ?", [idusers], (err, rows) => {
        res.render('customers_edit', {
          data: rows[0]
        })
      });
    });
  };
  
  controller.update = (req, res) => {
    const { idusers } = req.params;
    const newUser = req.body;
    req.getConnection((err, conn) => {
  
    conn.query('UPDATE users set ? where idusers = ?', [newUser, idusers], (err, rows) => {
      res.redirect('/');
    });
    });
  };
  
  controller.delete = (req, res) => {
    const { idusers } = req.params;
    req.getConnection((err, connection) => {
      connection.query('DELETE FROM users WHERE idusers = ?', [idusers], (err, rows) => {
        res.redirect('/');
      });
    });
  }
module.exports = controller;