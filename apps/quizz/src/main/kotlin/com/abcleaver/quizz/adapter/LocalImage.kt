package com.abcleaver.quizz.adapter

import com.abcleaver.quizz.domain.Letter
import com.abcleaver.quizz.port.ImageOut
import org.springframework.beans.factory.annotation.Value

import org.springframework.web.util.UriComponentsBuilder
import java.net.URI


class LocalImage( @Value("\${server.addressBis}") private val host : String,  @Value("\${server.port}")  private val port : String) : ImageOut {

  override fun getImage(letter: Letter): URI {


    return UriComponentsBuilder.newInstance()
      .scheme("http")
      .host(host).port(port)
      .path("/public/${letter}.jpg")
      .build()
      .toUri()

  }
}
