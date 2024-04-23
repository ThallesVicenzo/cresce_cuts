enum MainRoutes {
  splash('/splash'),
  home('/home'),
  inputDiscount('/input-discount'),
  defaultError('/defaultErrorPage');

  const MainRoutes(this.route);

  final String route;
}
