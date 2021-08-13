const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Ejercicio 0", function () {
    // Cantidad inicial de 1 millón de tokens
    const INITIAL_TOKEN_AMOUNT = ethers.utils.parseUnits('1000000', 'ether');
    
    let deployer, usuario, otroUsuario;

    beforeEach(async function () {

        [deployer, usuario, otroUsuario] = await ethers.getSigners();

        const BasicToken = await ethers.getContractFactory("BasicToken", deployer);

        this.token = await BasicToken.deploy(
            INITIAL_TOKEN_AMOUNT
        );
    });

    describe("Inicialización", function () {

        it('La cantidad de decimales es la esperada', async function () {
            expect(await this.token.decimals()).to.eq(18);    
        });

        it.skip('La cuenta minter es el deployer', async function () {
            // COMPLETAR
        });

        it('El total supply del token es el esperado', async function () {
            expect(await this.token.totalSupply()).to.eq(INITIAL_TOKEN_AMOUNT);
        });

        it.skip('Todo el total supply es asignado al deployer', async function () {
            // COMPLETAR
        });
    });

    describe("Transferencias", function() {
        it('Un usuario sin fondos no puede transferir', async function () {
            expect(await this.token.balanceOf(usuario.address)).to.eq(0);
            await expect(
                this.token.connect(usuario).transfer(otroUsuario.address, 1)
            ).to.be.reverted;
        });

        it('Un usuario con fondos puede transferir', async function () {
            expect(await this.token.balanceOf(deployer.address)).to.be.gt(0);
            await this.token.transfer(usuario.address, 1);
            expect(await this.token.balanceOf(usuario.address)).to.eq(1);
        });
    });

    describe("Minting", function() {

        it.skip('Un usuario sin permisos no puede mintear tokens', async function () {
            // COMPLETAR
        });

        it.skip('Un usuario con permisos puede mintear tokens', async function () {
            // COMPLETAR
        });
        
    });
});
