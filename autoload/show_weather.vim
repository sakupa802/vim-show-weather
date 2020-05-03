function! ShowWeather(city) abort
  if executable('curl')
    let cmd = "curl -s 'http://api.openweathermap.org/data/2.5/weather?units=metric&q=".a:city.",jp&APPID=".g:open_weather_appid."'"
    let result = json_decode(system(cmd))

    if result['cod'] == 200
      echo result['weather']
      echo result['main']
    else
      echoerr result
    endif
  else
    echoerr 'error! curl not available.'
  endif
endfunction
