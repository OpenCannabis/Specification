import Container from './container'

export default function Footer() {
  return (
    <footer className="bg-accent-1 border-t border-accent-2">
      <Container>
        <div className="py-28 flex flex-col lg:flex-row">
          <h3 className="text-3xl lg:text-4xl font-bold tracking-tighter leading-tight text-center lg:text-left mb-10 lg:mb-0 lg:pr-4 lg:w-1/2">
            OpenCannabis Project
          </h3>
          <div className="flex flex-col lg:flex-row justify-center items-center lg:pl-4 lg:w-1/2">
            <a
                href="/docs"
                className="mx-3 font-bold hover:underline"
                target="_blank"
            >
              Docs
            </a>
            <a
              href="https://github.com/OpenCannabis"
              className="mx-3 bg-black hover:bg-white hover:text-black border border-black text-white font-bold py-3 px-12 lg:px-8 duration-200 transition-colors mb-6 lg:mb-0"
              target="_blank"
            >
              GitHub
            </a>
          </div>
        </div>
      </Container>
    </footer>
  )
}
