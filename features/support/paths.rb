module NavigationHelpers
  def path_to(page_name)
    case page_name
      when /Pagina inicial do curso/
        '/curriculum_units/access/'

      when /the home\s?page/
        '/home'

      when /Login/
        '/login'

      when /Meu Solar/
        '/home'

      when /Cadastrar usuario/
        '/users/register'

      when /Recuperar senha/
        '/users/password/new'

      when /Meus Dados/
        '/users/edit'

      when /Matricula/
        '/offers/showoffersbyuser'
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
