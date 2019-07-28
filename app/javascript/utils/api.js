import axios from 'axios';

function getQueryString(params) {
    return Object.keys(params)
        .map(k => encodeURIComponent(k) + '=' + encodeURIComponent(params[k]))
        .join('&');
}

const get = (path, params) => {
    let url;
    if (typeof(params) !== 'undefined' && params !== {}) {
        const qs = '?' + getQueryString(params || {});
        url = path + qs;
    } else {
        url = path;
    }

    return axios({
        method: 'get',
        url: url
    })
};

const post = (path, params, headers = null) => {
    headers = headers || {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    };
    headers['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    return axios({
        method: 'post',
        url: path,
        headers: headers,
        data: params
    })
};

const put = (path, params, headers = null) => {
  headers = headers || {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
  };
  headers['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  return axios({
      method: 'put',
      url: path,
      headers: headers,
      data: params
  })
};

export default {
    get: get,
    post: post,
    put: put
}
