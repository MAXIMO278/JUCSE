const models = require('../models');
const lodash = require('lodash');
exports.create = async (req, res) => {
    let result = await models.KeyValuePairs.create(
        {
            key: req.body.key,
            value: req.body.value
        }
    );
    res.json(result);
};

exports.fetch = async (req, res) => {
    const filter = lodash.pick(req.body, ["key"]);
    let result = await models.KeyValuePairs.findAll({
        where: filter
    });
    res.json(result);
};

exports.list = async (req, res) => {
    const data = await models.KeyValuePairs.findAll();
    res.render('list', {data: data});
};