import Header from '../../components/Header';
import Footer from '../../components/Footer';

import emailIcon from '../../imagens/email.jpg';
import whatsIcon from '../../imagens/whatsapp.jpg';

import './styles.css';
import { useEffect, useState } from 'react';

import api from '../../services/api';

const ContactUs = () => {
  const [nome, setNome] = useState('');
  const [mensagem, setMensagem] = useState('');
  const [comentarios, setComentarios] = useState([]);

  useEffect(() => {
    async function buscarComentarios() {
      const response = await api.get('comentario');
      console.log(response)
      setComentarios(response.data);
    }
   
    buscarComentarios();
  }, [comentarios]);

  async function enviarDadosparaObanco(e) {
    e.preventDefault();

    if (nome !== '' && mensagem !== '') {
      await api.post('/comentario', {
        nome,
        mensagem,
      });
    }

    setNome('');
    setMensagem('');
  }

  return (
    <>
      <Header />
      <h2>Contato</h2>
      <hr />

      <section className='contatos'>
        <div className='contato'>
          <img src={emailIcon} width='40px' alt='Ícone de email' />
          <p>contato@fullstackeletro.com</p>
        </div>

        <div className='contato'>
          <img src={whatsIcon} width='40px' alt='Ícone do whatsapp' />
          <p>(11) 9999-9999</p>
        </div>
      </section>
      <div className='container mb-5'>
        <form
          onSubmit={enviarDadosparaObanco}
          className='feedback bg-danger text-white'
          method='POST'
        >
          <div className='form-group '>
            <label htmlFor='exampleFormControlInput1'>Nome</label>
            <input
              type='text'
              className='form-control'
              name='nome'
              id='exampleFormControlInput1'
              value={nome}
              placeholder='ex: João...'
              onChange={(e) => setNome(e.target.value)}
            />
          </div>

          <div className='form-group'>
            <label htmlFor='exampleFormControlTextarea1'>Mensagem</label>
            <textarea
              className='form-control'
              name='mensagem'
              id='exampleFormControlTextarea1'
              rows='3'
              value={mensagem}
              placeholder='ex: Otimo Produto...'
              onChange={(e) => setMensagem(e.target.value)}
            ></textarea>
          </div>

          <input className='btn btn-info' type='submit' value='Enviar' />
        </form>
      </div>

      {comentarios.map((item) => (
        <div className='card' key={item.id}>
          <h3>{item.nome}</h3>
          <p>{item.mensagem}</p>
        </div>
      ))}

      <Footer />
    </>
  );
};

export default ContactUs;
